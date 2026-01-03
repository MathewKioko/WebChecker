# Specify the Node.js version to use
ARG NODE_VERSION=21

# Specify the Debian version to use, the default is "bullseye"
ARG DEBIAN_VERSION=bullseye

# Use Node.js Docker image as the base image, with specific Node and Debian versions
FROM node:${NODE_VERSION}-${DEBIAN_VERSION} AS build

# Set the container's default shell to Bash and enable some options
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# Install Chromium browser and Download and verify Google Chrome's signing key
RUN apt-get update -qq --fix-missing && \
    apt-get -qqy install --allow-unauthenticated gnupg wget && \
    wget --quiet --output-document=- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/google-archive.gpg && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
    apt-get update -qq && \
    apt-get -qqy --no-install-recommends install chromium traceroute python make g++ && \
    rm -rf /var/lib/apt/lists/* 

# Run the Chromium browser's version command and redirect its output to the /etc/chromium-version file
RUN /usr/bin/chromium --no-sandbox --version > /etc/chromium-version

# Set the working directory to /app
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json package-lock.json ./

# Run npm install to install dependencies and clear npm cache
RUN npm install && \
    rm -rf /app/node_modules/.cache


# Copy all files to working directory
COPY . .

# Run npm build to build the application
RUN npm run build

# Final stage
FROM node:${NODE_VERSION}-${DEBIAN_VERSION}  AS final

WORKDIR /app

# Create non-root user for Railway deployment
RUN groupadd -r nodeapp && useradd -r -g nodeapp nodeapp && \
    mkdir -p /app/logs && chown -R nodeapp:nodeapp /app

COPY package.json package-lock.json ./
COPY --from=build /app .

RUN apt-get update && \
    apt-get install -y --no-install-recommends chromium traceroute && \
    chmod 755 /usr/bin/chromium && \
    rm -rf /var/lib/apt/lists/* /app/node_modules/.cache

# Set permissions for non-root user
RUN chown -R nodeapp:nodeapp /app

# Exposed container port, the default is 3000, which can be modified through the environment variable PORT
EXPOSE ${PORT:-3000}

# Set the environment variable CHROME_PATH to specify the path to the Chromium binaries
ENV CHROME_PATH='/usr/bin/chromium'

# Health check for Railway
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT:-3000}/ || exit 1

# Switch to non-root user
USER nodeapp

# Define the command executed when the container starts and start the server.js of the Node.js application
CMD ["npm", "start"]


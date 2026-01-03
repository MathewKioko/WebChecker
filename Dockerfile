# Use a smaller base image
FROM node:21-bullseye-slim AS build

WORKDIR /app

# Copy package files first for better caching
COPY package.json package-lock.json ./

# Install dependencies with production only
RUN npm ci --only=production && \
    npm cache clean --force

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Final stage - minimal image
FROM node:21-bullseye-slim

WORKDIR /app

# Install only essential runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        chromium \
        traceroute \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy from build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/server.js ./
COPY --from=build /app/api ./api
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./

ENV CHROME_PATH=/usr/bin/chromium
EXPOSE 3000

CMD ["node", "server"]

# Web Checker

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/MathewKioko/WebChecker.svg)](https://github.com/MathewKioko/WebChecker/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/MathewKioko/WebChecker.svg)](https://github.com/MathewKioko/WebChecker/issues)
[![GitHub forks](https://img.shields.io/github/forks/MathewKioko/WebChecker.svg)](https://github.com/MathewKioko/WebChecker/network)

Comprehensive, on-demand open source intelligence for any website

## 🚀 About

Web Checker is a powerful, all-in-one OSINT tool that provides comprehensive insights into any website. It helps you understand the inner workings of websites by uncovering potential attack vectors, analyzing server architecture, viewing security configurations, and learning what technologies a site is using.

## 📊 Features

- **IP Information**: Find server IP addresses and network details
- **SSL/TLS Analysis**: Check SSL certificates and security configurations
- **DNS Records**: View comprehensive DNS information
- **Security Headers**: Analyze HTTP security headers
- **Technology Stack**: Identify frameworks, libraries, and technologies used
- **Performance Metrics**: Get quality and performance insights
- **Domain Information**: Whois data and domain details
- **And much more...**

## 🛠️ Installation

### Option 1: Docker (Recommended)

```bash
docker run -p 3000:3000 mathewkioko/web-checker
```

### Option 2: From Source

1. Clone the repository:
```bash
git clone https://github.com/MathewKioko/WebChecker.git
cd WebChecker
```

2. Install dependencies:
```bash
yarn install
```

3. Build the application:
```bash
yarn build
```

4. Start the server:
```bash
yarn start
```

## 🚀 Deployment

### Netlify

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/MathewKioko/WebChecker)

### Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/MathewKioko/WebChecker)

### Fly.io

```bash
fly launch
```

### Railway (Recommended for Docker)

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?url=https://github.com/MathewKioko/WebChecker)

#### Manual Deployment to Railway

1. Install Railway CLI:
```bash
npm install -g @railway/cli
```

2. Login to Railway:
```bash
railway login
```

3. Initialize project:
```bash
railway init
```

4. Deploy:
```bash
railway up
```

5. Set environment variables in Railway dashboard or via CLI:
```bash
railway variables set PORT=3000
```

#### Railway Environment Variables

Configure the following environment variables in Railway:

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `3000` |
| `API_ENABLE_RATE_LIMIT` | Enable rate limiting | `true` |
| `API_TIMEOUT_LIMIT` | API timeout in milliseconds | `20000` |
| `API_CORS_ORIGIN` | CORS origin | `*` |
| `BOSS_SERVER` | Enable boss mode | `false` |
| `DISABLE_GUI` | Disable web interface | `false` |

## ⚙️ Configuration

You can configure Web Checker using environment variables:

```bash
# Server configuration
PORT=3000
API_ENABLE_RATE_LIMIT=true
API_TIMEOUT_LIMIT=20000
API_CORS_ORIGIN=your-domain.com

# Browser configuration
CHROME_PATH=/usr/bin/chromium

# API Keys (optional)
GOOGLE_CLOUD_API_KEY=your-key-here
REACT_APP_SHODAN_API_KEY=your-key-here
REACT_APP_WHO_API_KEY=your-key-here
```

## 🤝 Contributing

Contributions are always welcome! Please read the [contribution guidelines](CONTRIBUTING.md) first.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Support

If you find this project useful, consider:

- ⭐ Starring this repository
- 🐛 Reporting issues
- 💡 Suggesting features
- 🐦 Following me on [GitHub](https://github.com/MathewKioko)

## 📞 Contact

- **Email**: mathewkioko@protonmail.com
- **GitHub**: [@MathewKioko](https://github.com/MathewKioko)
- **Website**: [mathewkioko.dev](https://mathewkioko.dev)

## 🔗 Links

- [Documentation](https://github.com/MathewKioko/WebChecker/wiki)
- [Issues](https://github.com/MathewKioko/WebChecker/issues)
- [Discussions](https://github.com/MathewKioko/WebChecker/discussions)

---

**Made with ❤️ by [Mathew Kioko](https://github.com/MathewKioko)**
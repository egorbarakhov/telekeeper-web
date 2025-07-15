# Telekeeper Web Application

[![Ruby on Rails CI](https://github.com/EgorBarakhov/telekeeper-web/actions/workflows/ci.yml/badge.svg)](https://github.com/yourorg/telekeeper-web/actions)
[![GRPC API Status](https://img.shields.io/badge/gRPC-API%20ready-brightgreen)](https://github.com/yourorg/telekeeper-proto)
[![Telegram Mini App](https://img.shields.io/badge/Telegram-Mini%20App-blue)](https://core.telegram.org/bots/webapps)

> Your personal Telegram knowledge vault. Save, organize and rediscover valuable content.

## 🌟 Overview

Telekeeper is a Telegram-native service that allows users to:
- **Preserve** posts from channels (even if deleted)
- **Organize** content with tags and collections
- **Rediscover** saved content through powerful search
- **Access** anytime via Telegram Mini App

This repository contains the core web application (Rails backend + Hotwire frontend) that powers:
1. Mini App interface in Telegram
2. gRPC API for Telegram Bot
3. NATS event processing
4. Content management system

## 🚀 Features

- **Content Preservation**
  - Full post archiving (text + media)
  - Version history tracking
  - Automatic metadata extraction
- **Intelligent Organization**
  - AI-assisted tagging
  - Custom collections
  - Cross-post linking
- **Blazing Fast Search**
  - Full-text search with typo tolerance
  - Filter by tags/channels/dates
  - Semantic content discovery
- **Telegram Integration**
  - Seamless Mini App experience
  - Instant content saving via bot
  - Notification system

## 🧩 Tech Stack

| Component              | Technology                  |
|------------------------|----------------------------|
| **Backend**            | Ruby on Rails 8.1          |
| **Frontend**           | Hotwire (Turbo + Stimulus) |
| **Database**           | PostgreSQL 18, Redis             |
| **Storage**            | S3                  |
| **gRPC Tooling**     | Envoy            |
| **Async Processing**   | NATS JetStream             |
| **Infrastructure**     | Docker, Cloud       |
| **Monitoring**         | Prometheus + Grafana       |


## 🛠 Installation

### 1. Install environment
- Docker Desktop
- Dev Containers CLI

### 2. Clone and configure
```bash
git clone https://github.com/yourorg/telekeeper-web.git
cd telekeeper-web
cp .env.example .env
```

### 2. Build and start
```bash
devcontainer build
devcontainer up
```

## 🌐 Development Workflow

### Attach to service
```bash
devcontainer exec bash
```

### Code generation
TBD

### Testing
```bash
# Run all tests
bin/rails test

# Specific tests
bin/rails test:system
bin/rails test:grpc      # gRPC service tests
bin/rails test:nats      # Event handler tests
```

## 🧭 Application Structure

```
telekeeper-web/
├── app/
│   ├── controllers/       # HTTP controllers (Mini App)
│   ├── rpc/               # gRPC service implementations
│   ├── consumers/         # NATS event consumers
│   ├── jobs/              # ActiveJob background jobs
│   ├── models/            # Domain models
│   └── views/             # Turbo-powered Mini App views
├── config/
│   ├── environments/      # Environment configs
│   ├── initializers/      # Rails initialization
│   ├── locales/           # I18n translations
│   └── routes/            # Split route definitions
└── spec/                  # Comprehensive tests
```

## 🔌 Integration Points

| Component         | Endpoint                    | Protocol |
|-------------------|----------------------------|----------|
| TBD               | TBD                        | TBD      |

## 🚢 Deployment

Production deployment uses Docker:
TBD with Kamal

## 📚 Documentation

- [C4 schema](docs/c4/)

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'feat: Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📜 License

TBD

---
**Telegram Ecosystem Project** • [Bot Demo]() TBD • [System Status]() TBD

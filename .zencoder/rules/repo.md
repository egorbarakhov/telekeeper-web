---
description: Repository Information Overview
alwaysApply: true
---

# Telekeeper Web Information

## Summary
Telekeeper is a Telegram-native service that allows users to preserve, organize, and rediscover content from Telegram channels. This repository contains the core web application built with Rails backend and Hotwire frontend that powers the Mini App interface in Telegram, gRPC API for Telegram Bot, NATS event processing, and content management system.

## Structure
- **app/**: MVC components, gRPC services, NATS consumers
- **bin/**: Executable scripts for development and deployment
- **config/**: Rails configuration files
- **db/**: Database migrations and schema
- **docs/**: Project documentation including C4 diagrams
- **test/**: Test suite for the application
- **.devcontainer/**: Development container configuration
- **.github/**: CI/CD workflows

## Language & Runtime
**Language**: Ruby
**Version**: 3.4.4
**Framework**: Ruby on Rails 8.0.2
**Build System**: Bundler
**Package Manager**: Bundler/Gem

## Dependencies
**Main Dependencies**:
- Rails (~> 8.0.2)
- PostgreSQL (>= 1.6.0.rc1)
- Puma (>= 5.0)
- Hotwire (Turbo + Stimulus)
- Importmap Rails
- Solid Cache/Queue/Cable
- Kamal (deployment)
- Thruster (HTTP asset caching)

**Development Dependencies**:
- Debug
- Brakeman (security scanning)
- Rubocop (linting)
- Pry (debugging)
- Strong Migrations
- Web Console

## Build & Installation
```bash
# Clone and configure
git clone https://github.com/yourorg/telekeeper-web.git
cd telekeeper-web
cp .env.example .env

# Build and start with Dev Containers
devcontainer build
devcontainer up

# Attach to service
devcontainer exec bash
```

## Docker
**Dockerfile**: Dockerfile
**Base Image**: ruby:3.4.4-slim
**Configuration**: Multi-stage build with production optimizations
**Run Command**:
```bash
docker build -t telekeeper_web .
docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value> --name telekeeper_web telekeeper_web
```

## Testing
**Framework**: Rails Test (Minitest)
**Test Location**: test/
**Configuration**: test/test_helper.rb
**Run Command**:
```bash
# Run all tests
bin/rails test

# Specific tests
bin/rails test:system
bin/rails test:grpc      # gRPC service tests
bin/rails test:nats      # Event handler tests
```

## CI/CD
**Provider**: GitHub Actions
**Workflows**:
- Security scanning (Brakeman, Importmap audit)
- Linting (Rubocop)
- Testing (Rails tests with PostgreSQL service)
**Deployment**: Kamal (Docker-based deployment)

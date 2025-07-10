# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

USER root
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    libc6:i386 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libatspi2.0-0 \
    libnss3 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libgbm1 \
    libasound2 \
    protobuf-compiler

USER vscode

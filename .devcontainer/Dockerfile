# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.5
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

USER root
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    # Windsurf's Playwright dependencies
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libatspi2.0-0

USER vscode

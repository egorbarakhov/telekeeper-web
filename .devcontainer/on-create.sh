#!/bin/bash
set -e

# Run setup
gem update --system
gem install solargraph --no-document ruby-lsp
bin/setup --skip-server

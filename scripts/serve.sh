#!/bin/bash

# Script to build and serve the Jekyll website locally
# This script uses Ruby 3.3 installed via Homebrew

echo "🌐 Building and serving Jekyll website..."
echo "========================================="

# Define Ruby path
RUBY_PATH="/opt/homebrew/opt/ruby@3.3/bin"

# Check if Ruby 3.3 is installed
if [ ! -f "$RUBY_PATH/ruby" ]; then
    echo "❌ Ruby 3.3 not found. Installing via Homebrew..."
    brew install ruby@3.3
fi

# Check if bundler is installed
if ! $RUBY_PATH/gem list bundler -i &> /dev/null; then
    echo "📦 Installing bundler..."
    $RUBY_PATH/gem install bundler
fi

# Install dependencies if needed
echo "📦 Installing dependencies..."
$RUBY_PATH/bundle install

# Serve the website
echo ""
echo "🚀 Starting Jekyll server with live reload..."
echo "   → Website: http://localhost:4000"
echo "   → LiveReload: Enabled"
echo ""
echo "Press Ctrl+C to stop the server"
echo "========================================="
echo ""

$RUBY_PATH/bundle exec jekyll serve --livereload --port 4000

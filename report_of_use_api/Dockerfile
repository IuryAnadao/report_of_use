# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM ruby:$RUBY_VERSION

# Rails app lives here
WORKDIR /rails

# Copy application code
COPY . .

# Set production environment
ENV RAILS_ENV="development" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Install packages needed to build gems
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libvips \
    pkg-config \
    vim \
    htop

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Start the server by default, this can be overwritten at runtime
EXPOSE 8000
CMD ["./start_development.sh"]

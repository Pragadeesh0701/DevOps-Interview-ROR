# Use a lightweight Ruby image
FROM ruby:3.2.2-slim

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get  -o Acquire::ForceIPv4=true update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    curl \
    npm && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/app

# Copy Gemfile and Gemfile.lock first (for caching dependencies)
COPY Gemfile Gemfile.lock ./

# Install Bundler and project dependencies
RUN gem install bundler && bundle install --jobs 4 --retry 3

# Copy the application code
COPY . .

# Precompile assets
RUN bundle exec rails assets:precompile && \
    bundle exec rails assets:clean

# Copy and set permissions for the entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh"]

# Expose port 3000
EXPOSE 3000

# Start the Rails application using Puma
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

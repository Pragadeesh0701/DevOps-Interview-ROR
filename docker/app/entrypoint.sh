#!/bin/sh
set -e

# Remove any existing PID file
rm -f /var/app/tmp/pids/server.pid

# Run database migrations
bundle exec rails db:migrate

# Execute the given CMD (Puma server)
exec "$@"

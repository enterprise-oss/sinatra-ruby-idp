#!/bin/sh
set -e

APP_PORT=${APP_PORT:-9292}
export PUBLIC_URL="${PUBLIC_URL:-"http://127.0.0.1:9292"}"

exec bundle exec rackup --host :: --port "${APP_PORT}"

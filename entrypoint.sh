#!/bin/sh
set -e

APP_PORT=${APP_PORT:-9292}

exec bundle exec rackup --host ::  --port "${APP_PORT}"

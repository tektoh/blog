#!/bin/bash

set -e

COMMANDLINE="$@"

if echo "$@" | grep -q 'bundle exec rails server'; then
  [ -f $APP_PATH/tmp/pids/server.pid ] && rm -v -f $APP_PATH/tmp/pids/server.pid
fi

echo EXEC: "$@"
exec "$@"

#!/bin/bash

set -e

unset BUNDLE_PATH
unset BUNDLE_BIN
bundle check || bundle install --clean --jobs=4 --quiet

yarn check || yarn install --silent

if [ -f $APP_PATH/tmp/pids/server.pid ]; then
  rm $APP_PATH/tmp/pids/server.pid
fi

exec "$@"

#!/bin/sh
set -e

LOG_LEVEL=${LOG_LEVEL:-3}
LOG_LEVEL_TERMINAL=${LOG_LEVEL_TERMINAL:-3}
FILE_PORT=${FILE_PORT:-30303}
QUERY_PORT=${QUERY_PORT:-10101}
ALLOW_WEBLIST=${ALLOW_WEBLIST:-0}
EXPERIMENTAL_31=${EXPERIMENTAL_31:-0}
DEFAULT_PORT=${DEFAULT_PORT:-9987}
CONNECT_LIMIT=${CONNECT_LIMIT:-10}
CONNECT_LIMIT_CLIENT=${CONNECT_LIMIT_CLIENT:-3}
WEB_ENABLED=${WEB_ENABLED:-1}
MUSIC_ENABLED=${MUSIC_ENABLED:-1}

if [ ! -f /opt/teaspeak/config.yml ]; then
    echo "version: 15
general: 
  database: 
    url: sqlite://database/TeaData.sqlite 
    sqlite: 
log: 
  level: $LOG_LEVEL
  terminal_level: $LOG_LEVEL_TERMINAL
binding:
  file: 
    port: $FILE_PORT
  query: 
    port: $QUERY_PORT
server: 
  allow_weblist: $ALLOW_WEBLIST
voice: 
  protocol: 
    experimental_31: $EXPERIMENTAL_31
  default_port: $DEFAULT_PORT
  connect_limit: $CONNECT_LIMIT
  client_connect_limit: $CONNECT_LIMIT_CLIENT
web: 
  enabled: $WEB_ENABLED
music:
  enabled: $MUSIC_ENABLED" >> /opt/teaspeak/config.yml
    chown teaspeak:teaspeak /opt/teaspeak/config.yml
fi

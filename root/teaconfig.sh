#!/bin/sh
set -e
if [ ! -f /opt/teaspeak/config.yml ]; then
    echo "version: 15" >> /opt/teaspeak/config.yml
    echo "general:" >> /opt/teaspeak/config.yml
    echo "  database:" >> /opt/teaspeak/config.yml
    echo "    url: sqlite://database/TeaData.sqlite" >> /opt/teaspeak/config.yml
    echo "    sqlite:" >> /opt/teaspeak/config.yml
    echo "log": >> /opt/teaspeak/config.yml
    echo "  level: $LOG_LEVEL" >> /opt/teaspeak/config.yml
    echo "binding:">> /opt/teaspeak/config.yml
    echo "  file:" >> /opt/teaspeak/config.yml
    echo "    port: $FILE_PORT" >> /opt/teaspeak/config.yml
    echo "  query:" >> /opt/teaspeak/config.yml
    echo "    port: $QUERY_PORT" >> /opt/teaspeak/config.yml
    echo "server:" >> /opt/teaspeak/config.yml
    echo "  allow_weblist: $ALLOW_WEBLIST" >> /opt/teaspeak/config.yml
    echo "voice:" >> /opt/teaspeak/config.yml
    echo "  protocol:" >> /opt/teaspeak/config.yml
    echo "    experimental_31: $EXPERIMENTAL_31" >> /opt/teaspeak/config.yml
    echo "  default_port: $DEFAULT_PORT" >> /opt/teaspeak/config.yml
    echo "web:" >> /opt/teaspeak/config.yml
    echo "  enabled: $WEB_ENABLED" >> /opt/teaspeak/config.yml
    echo "music:" >> /opt/teaspeak/config.yml
    echo "  enabled: $MUSIC_ENABLED" >> /opt/teaspeak/config.yml
fi
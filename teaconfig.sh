#!/bin/sh
set -e
if [ ! -f /opt/teaspeak/config.yml ]; then
    echo "version: 15" >> /opt/teaspeak/config.yml
    echo "general:" >> /opt/teaspeak/config.yml
    echo "  database:" >> /opt/teaspeak/config.yml
    echo "    url: sqlite://database/TeaData.sqlite" >> /opt/teaspeak/config.yml
    echo "    sqlite:" >> /opt/teaspeak/config.yml
    echo "log": >> /opt/teaspeak/config.yml
    if [ "${LOG_LEVEL}" ]; then echo "  level: $LOG_LEVEL" >> /opt/teaspeak/config.yml; else echo "  level: 3" >> /opt/teaspeak/config.yml; fi
    if [ "${LOG_LEVEL_TERMINAL}" ]; then echo "  terminal_level: $LOG_LEVEL_TERMINAL" >> /opt/teaspeak/config.yml; else echo "  terminal_level: 3" >> /opt/teaspeak/config.yml; fi
    echo "binding:">> /opt/teaspeak/config.yml
    echo "  file:" >> /opt/teaspeak/config.yml
    if [ "${FILE_PORT}" ]; then echo "    port: $FILE_PORT" >> /opt/teaspeak/config.yml; else echo "    port: 30303" >> /opt/teaspeak/config.yml; fi
    echo "  query:" >> /opt/teaspeak/config.yml
    if [ "${QUERY_PORT}" ]; then echo "    port: $QUERY_PORT" >> /opt/teaspeak/config.yml; else echo "    port: 10101" >> /opt/teaspeak/config.yml; fi
    echo "server:" >> /opt/teaspeak/config.yml
    if [ "${ALLOW_WEBLIST}" ]; then echo "  allow_weblist: $ALLOW_WEBLIST" >> /opt/teaspeak/config.yml; else echo "  allow_weblist: 0" >> /opt/teaspeak/config.yml; fi
    echo "voice:" >> /opt/teaspeak/config.yml
    echo "  protocol:" >> /opt/teaspeak/config.yml
    if [ "${EXPERIMENTAL_31}" ]; then echo "    experimental_31: $EXPERIMENTAL_31" >> /opt/teaspeak/config.yml; else echo "    experimental_31: 0" >> /opt/teaspeak/config.yml; fi
    if [ "${DEFAULT_PORT}" ]; then echo "  default_port: $DEFAULT_PORT" >> /opt/teaspeak/config.yml; else echo "  default_port: 9987" >> /opt/teaspeak/config.yml; fi
    if [ "${CONNECT_LIMIT}" ]; then echo "  connect_limit: $CONNECT_LIMIT" >> /opt/teaspeak/config.yml; else echo "  connect_limit: 10" >> /opt/teaspeak/config.yml; fi
    if [ "${CONNECT_LIMIT_CLIENT}" ]; then echo "  client_connect_limit: $CONNECT_LIMIT_CLIENT" >> /opt/teaspeak/config.yml; else echo "  client_connect_limit: 3" >> /opt/teaspeak/config.yml; fi
    echo "web:" >> /opt/teaspeak/config.yml
    if [ "${WEB_ENABLED}" ]; then echo "  enabled: $WEB_ENABLED" >> /opt/teaspeak/config.yml; else echo "  enabled: 1" >> /opt/teaspeak/config.yml; fi
    echo "music:" >> /opt/teaspeak/config.yml
    if [ "${MUSIC_ENABLED}" ]; then echo "  enabled: $MUSIC_ENABLED" >> /opt/teaspeak/config.yml; else echo "  enabled: 1" >> /opt/teaspeak/config.yml; fi
    chown teaspeak:teaspeak /opt/teaspeak/config.yml
fi
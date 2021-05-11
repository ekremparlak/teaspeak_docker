# Teaspeak Docker Image

### Usage

```
docker run -d \
	-v teaspeak_files:/opt/teaspeak/files \
	-v teaspeak_db:/opt/teaspeak/database \
	-v teaspeak_certs:/opt/teaspeak/certs \
	-v teaspeak_logs:/opt/teaspeak/logs \
	-p 10101:10101 -p 30303:30303 -p 9987:9987 -p 9987:9987/udp \
	--restart=unless-stopped --name teaspeak eparlak/teaspeak
  ```

### Logs and Token
```
docker logs teaspeak
```
### Docker-compose

````
version: "3"
services:
  teaspeak:
    container_name: teaspeak
    image: eparlak/teaspeak
    ports:
      - 30303:30303/tcp
      - 10101:10101/tcp
      - 9987:9987/udp
      - 9987:9987/tcp
    restart: unless-stopped
    volumes:
      - ./logs:/opt/teaspeak/logs
      - ./files:/opt/teaspeak/files
      - ./db:/opt/teaspeak/database
      - ./certs:/opt/teaspeak/certs
````

## Environment Variables

`DEFAULT_PORT` Default: 9987

`QUERY_PORT` Default: 10101 

`FILE_PORT` Default: 30303 

`EXPERIMENTAL_31` Default: 0 If you wanna use this you need to mount the protocol_key.tx with `-v /path/to/protocol_key.txt:/opt/teaspeak/protocol_key.txt`

`ALLOW_WEBLIST` Default: 0 Enable/disable weblist reports globally!

`WEB_ENABLED` Default: 1 Disable/enable the possibility to connect via the TeaSpeak web client

`MUSIC_ENABLED` Default: 1 Enable/disable the music bots

`LOG_LEVEL` Default: 3 The log level within the log files

`LOG_LEVEL_TERMINAL` Default: 3 The log level within the TeaSpeak server terminal

`CONNECT_LIMIT` Default: 10 Maximum amount of join attempts per second.

`CONNECT_LIMIT_CLIENT` Default: 3 Maximum amount of join attempts per second per ip


  
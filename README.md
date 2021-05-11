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

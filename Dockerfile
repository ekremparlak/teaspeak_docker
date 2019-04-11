FROM debian:9.5-slim
RUN mkdir -p /opt/teaspeak
RUN apt-get update -y &&\
	apt-get --no-install-recommends install -y wget curl unzip ca-certificates python &&\
	rm -rf /var/lib/apt/lists/* &&\
	wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl &&\
	chmod a+rx /usr/local/bin/youtube-dl
WORKDIR /opt/teaspeak
RUN wget https://repo.teaspeak.de/server/linux/amd64_optimized/TeaSpeak-1.3.15-beta.tar.gz &&\
	tar -xzf TeaSpeak-1.3.15-beta.tar.gz &&\
	rm TeaSpeak-1.3.15-beta.tar.gz
RUN ./install_libnice.sh
RUN ./install_music.sh install
RUN apt-get purge -y wget curl unzip
COPY config.yml /opt/teaspeak/
COPY protocol_key.txt /opt/teaspeak/
EXPOSE 10011/tcp 30033/tcp 9987/udp 9987/tcp
VOLUME /opt/teaspeak/files /opt/teaspeak/database /opt/teaspeak/certs /opt/teaspeak/logs
CMD ./teastart_minimal.sh

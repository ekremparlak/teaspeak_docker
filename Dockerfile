FROM debian:10-slim
RUN mkdir -p /opt/teaspeak
WORKDIR /opt/teaspeak
RUN apt-get update -y &&\
        apt-get --no-install-recommends install -y wget curl unzip ca-certificates python &&\
        wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl &&\
        chmod a+rx /usr/local/bin/youtube-dl &&\
        wget https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-1.3.25-2.tar.gz &&\
        tar -xzf TeaSpeak-1.3.25-2.tar.gz &&\
        rm TeaSpeak-1.3.25-2.tar.gz &&\
        ./install_libnice.sh &&\
        ./install_music.sh install &&\
        apt-get purge -y wget curl unzip &&\
        rm -r tmp_files &&\
        rm -rf /var/lib/apt/lists/*
COPY config.yml /opt/teaspeak/
COPY protocol_key.txt /opt/teaspeak/
EXPOSE 10011/tcp 30033/tcp 9987/udp 9987/tcp
VOLUME /opt/teaspeak/files /opt/teaspeak/database /opt/teaspeak/certs /opt/teaspeak/logs
SHELL ["/bin/bash", "-c"]
CMD ./teastart_minimal.sh

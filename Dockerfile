FROM debian:10-slim
ARG VERSION=1.4.22
RUN mkdir -p /opt/teaspeak
WORKDIR /opt/teaspeak
RUN useradd -M teaspeak
RUN apt-get update -y &&\
        apt-get --no-install-recommends install -y wget curl unzip ca-certificates python &&\
        wget https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-$VERSION.tar.gz &&\
        tar -xzf TeaSpeak-$VERSION.tar.gz &&\
        rm TeaSpeak-$VERSION.tar.gz &&\
        ./install_music.sh install &&\
        apt-get purge -y wget curl unzip &&\
        apt autoremove -y &&\
        rm -r tmp_files &&\
        rm -rf /var/lib/apt/lists/* &&\
        chown -R teaspeak:teaspeak /opt/teaspeak
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /
COPY cont-init.d /etc/cont-init.d
COPY fix-attrs.d /etc/fix-attrs.d
COPY services.d /etc/services.d
COPY teaconfig.sh /
EXPOSE 10101/tcp 30303/tcp 9987/udp 9987/tcp
VOLUME /opt/teaspeak/files /opt/teaspeak/database /opt/teaspeak/certs /opt/teaspeak/logs
ENTRYPOINT ["/init"]

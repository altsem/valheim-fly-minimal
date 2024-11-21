FROM fedora:41

RUN groupadd -g "${PGID:-1000}" -o valheim \
    && useradd -g "${PGID:-1000}" -u "${PUID:-1000}" -o --create-home valheim \
    && dnf -y update \
    && dnf -y install socat glibc.i686 libstdc++.i686 libatomic pulseaudio-libs-devel \
    && dnf clean all \
    && mkdir -p /opt/steamcmd \
    && curl -L -o /tmp/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar xzvf /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd/ \
    && chown -R valheim:valheim /opt/steamcmd \
    && rm -rf /tmp/* /var/tmp/*

COPY --chmod=0755 fly-bootstrap.sh /fly-bootstrap.sh

WORKDIR /home/valheim
USER valheim

CMD ["/fly-bootstrap.sh"]

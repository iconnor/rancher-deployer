FROM alpine:3.4

MAINTAINER Josh Strange <josh@joshstrange.com>

ENV RANCHER_URL=http://127.0.0.1:8080/v1/projects/1a5 \
    RANCHER_ACCESS_KEY=none \
    RANCHER_SECRET_KEY=none \
    RANCHER_STACK_ID=project \
    RANCHER_STACK_NAME=project \
    RANCHER_SERVICE_NAME=service

ADD upgrade.sh /root/upgrade.sh

RUN chmod +x /root/upgrade.sh && \
    apk -U upgrade && \
    apk add --no-cache --update \
    curl \
    unzip \
    tar \
    gzip \
    sed \
    ca-certificates && \
    update-ca-certificates --fresh && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    curl -L \
    https://github.com/rancher/rancher-compose/releases/download/v0.12.0/rancher-compose-linux-amd64-v0.12.0.tar.gz \
    -o rancher-compose.tar.gz && \
    tar zxvf rancher-compose.tar.gz --strip-components 2 && \
    rm -rf rancher-compose.tar.gz && \
    mv rancher-compose /usr/bin/rancher-compose && \
    chmod +x /usr/bin/rancher-compose

CMD ["/root/upgrade.sh"]

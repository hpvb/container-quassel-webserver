FROM fedora:31

RUN dnf -y --refresh update && dnf -y install npm git nodejs && dnf clean all && \
    cd /root && \
    git clone https://github.com/magne4000/quassel-webserver.git && \
    cd quassel-webserver && \
    npm install --production

COPY start.sh /root/quassel-webserver
EXPOSE 64443

WORKDIR /root/quassel-webserver

ENTRYPOINT [ "./start.sh", "-c", "settings.js" ]


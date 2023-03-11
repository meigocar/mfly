##

FROM alpine:latest

WORKDIR /root

RUN set -ex \
    && apk add --no-cache tzdata openssl ca-certificates \
    && curl -o start.sh https://raw.githubusercontent.com/meigocar/mfly/main/azure/start.sh \
    && chmod +x start.sh

CMD [ "start.sh" ]

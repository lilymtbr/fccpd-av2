FROM alpine:latest

RUN apk add --no-cache sqlite

WORKDIR /data

COPY init.sql /init.sql
COPY setup.sh /setup.sh

RUN chmod +x /setup.sh

CMD ["sh"]
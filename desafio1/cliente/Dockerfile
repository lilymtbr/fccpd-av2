FROM alpine:latest

RUN apk add --no-cache curl

CMD while true; do \
    echo "=== Fazendo requisição para o servidor ===" && \
    curl -s http://servidor:8080 && \
    echo "" && \
    echo "Aguardando 5 segundos..." && \
    sleep 5; \
    done
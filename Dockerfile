FROM alpine:3.23

RUN apk add --no-cache ca-certificates tzdata && \
    mkdir -p /app /var/tgnas

COPY tgnas /usr/local/bin/tgnas
COPY config.yaml /app/config.yaml
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod 755 /usr/local/bin/tgnas /app/entrypoint.sh

WORKDIR /app
EXPOSE 10000

CMD ["/app/entrypoint.sh"]

FROM alpine:3.20

RUN apk add --no-cache bash openssl unzip

WORKDIR /certs

COPY generate.sh /certs/generate.sh
RUN chmod +x /certs/generate.sh

ENTRYPOINT ["/certs/generate.sh"]

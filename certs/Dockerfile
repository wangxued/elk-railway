FROM alpine:3.20

RUN apk add --no-cache bash openssl unzip

WORKDIR /certs

COPY generate.sh ./generate.sh
RUN chmod +x ./generate.sh

ENTRYPOINT ["./generate.sh"]

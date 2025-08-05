# syntax=docker/dockerfile:1
ARG LOGSTASH_VERSION=9.1.0
FROM docker.elastic.co/logstash/logstash-wolfi:${LOGSTASH_VERSION}

# Copy pipeline and config
COPY ./pipeline /usr/share/logstash/pipeline
COPY ./config/logstash.yml /usr/share/logstash/config/logstash.yml
COPY ../certs/logstash.crt /usr/share/logstash/certs/logstash.crt
COPY ../certs/logstash.key /usr/share/logstash/certs/logstash.key
COPY ../certs/ca.crt /usr/share/logstash/certs/ca.crt



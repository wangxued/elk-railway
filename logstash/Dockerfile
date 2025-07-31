# syntax=docker/dockerfile:1
ARG LOGSTASH_VERSION=9.1.0
FROM docker.elastic.co/logstash/logstash-wolfi:${LOGSTASH_VERSION}

# Copy pipeline and config
COPY ./logstash/pipeline /usr/share/logstash/pipeline
COPY ./logstash/config/logstash.yml /usr/share/logstash/config/logstash.yml

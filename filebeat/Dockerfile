# syntax=docker/dockerfile:1
ARG FILEBEAT_VERSION=9.1.0
FROM docker.elastic.co/beats/filebeat-wolfi:${FILEBEAT_VERSION}

# Copy config and certs
COPY ./filebeat.yml /usr/share/filebeat/filebeat.yml
COPY ./test-logs/test.log /data/logs/test.log
COPY ./certs /usr/share/filebeat/certs

ENTRYPOINT ["filebeat", "-e", "--strict.perms=false"]

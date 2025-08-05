# syntax=docker/dockerfile:1
ARG KIBANA_VERSION=9.1.0
FROM docker.elastic.co/kibana/kibana-wolfi:${KIBANA_VERSION}
COPY ../certs/kibana.crt /usr/share/kibana/certs/kibana.crt
COPY ../certs/kibana.key /usr/share/kibana/certs/kibana.key
COPY ../certs/ca.crt /usr/share/kibana/certs/ca.crt

USER kibana

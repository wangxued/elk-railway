
ARG ELASTICSEARCH_VERSION=9.1.0
ARG ELASTICSEARCH_HOST
ARG ELASTIC_PASSWORD
ARG KIBANA_PASSWORD
FROM docker.elastic.co/elasticsearch/elasticsearch-wolfi:${ELASTICSEARCH_VERSION}

# Add entrypoint script for cert permissions and kibana_system password
# COPY entrypoint-init.sh /usr/local/bin/entrypoint-init.sh

COPY ../certs/elasticsearch.crt /usr/share/elasticsearch/config/certs/elasticsearch.crt
COPY ../certs/elasticsearch.key /usr/share/elasticsearch/config/certs/elasticsearch.key
COPY ../certs/ca.crt /usr/share/elasticsearch/config/certs/ca.crt

COPY --chmod=755 entrypoint-init.sh /usr/local/bin/entrypoint-init.sh

USER elasticsearch
ENTRYPOINT ["/usr/local/bin/entrypoint-init.sh"]

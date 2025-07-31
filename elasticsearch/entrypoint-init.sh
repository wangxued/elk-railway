#!/bin/bash
set -e

echo "Setting file permissions"
chown -R root:root /usr/share/elasticsearch/config/certs
find /usr/share/elasticsearch/config/certs -type d -exec chmod 750 {} \;
find /usr/share/elasticsearch/config/certs -type f -exec chmod 640 {} \;

 # Start Elasticsearch (official entrypoint) and set kibana_system password in background
function wait_and_set_kibana_password() {
  echo "Waiting for Elasticsearch availability..."
  until curl -s --cacert /usr/share/elasticsearch/config/certs/ca.crt https://localhost:9200 | grep -q "missing authentication credentials"; do sleep 10; done;

  if [[ -n "$KIBANA_PASSWORD" ]]; then
    echo "Setting kibana_system password"
    until curl -s -X POST --cacert /usr/share/elasticsearch/config/certs/ca.crt -u "elastic:${ELASTIC_PASSWORD}" -H "Content-Type: application/json" https://localhost:9200/_security/user/kibana_system/_password -d "{\"password\":\"${KIBANA_PASSWORD}\"}" | grep -q "^{}"; do sleep 10; done;
  fi
  echo "All done!"
}

# Run password setting logic in background
wait_and_set_kibana_password &

# Hand over control to official entrypoint, keep signal and argument passing
exec /usr/local/bin/docker-entrypoint.sh eswrapper

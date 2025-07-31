# elasticsearch railway variables
PORT="9200"
NODE_NAME=elasticsearch
HTTP_HOST=0.0.0.0
TRANSPORT_HOST=0.0.0.0
DISCOVERY_TYPE=single-node
ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=changeme
ES_JAVA_OPTS=-Xms512m -Xmx512m
XPACK_SECURITY_ENABLED=true
XPACK_SECURITY_HTTP_SSL_ENABLED=true
XPACK_SECURITY_HTTP_SSL_KEY=/usr/share/elasticsearch/config/certs/elasticsearch.key
XPACK_SECURITY_HTTP_SSL_CERTIFICATE=/usr/share/elasticsearch/config/certs/elasticsearch.crt
XPACK_SECURITY_HTTP_SSL_CERTIFICATE_AUTHORITIES=/usr/share/elasticsearch/config/certs/ca.crt
XPACK_SECURITY_TRANSPORT_SSL_ENABLED=true
XPACK_SECURITY_TRANSPORT_SSL_KEY=/usr/share/elasticsearch/config/certs/elasticsearch.key
XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE=/usr/share/elasticsearch/config/certs/elasticsearch.crt
XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE_AUTHORITIES=/usr/share/elasticsearch/config/certs/ca.crt

# kibana railway variables
PORT="5601"
SERVER_NAME=kibana
ELASTICSEARCH_HOSTS="https://${{Elasticsearch.RAILWAY_PRIVATE_DOMAIN}}:${{Elasticsearch.PORT}}"
ELASTICSEARCH_USERNAME="${{Elasticsearch.ELASTIC_USERNAME}}"
ELASTICSEARCH_PASSWORD="${{Elasticsearch.ELASTIC_PASSWORD}}"
ELASTICSEARCH_SSL_CERTIFICATEAUTHORITIES=config/certs/ca.crt
XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY=at_least_32_characters_long
SERVER_PUBLICBASEURL="https://${{Kibana.RAILWAY_PUBLIC_DOMAIN}}"
XPACK_SECURITY_ENABLED="${{Elasticsearch.XPACK_SECURITY_ENABLED}}"
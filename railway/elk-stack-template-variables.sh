# elasticsearch railway variables
PORT="9200"
HTTP_HOST="0.0.0.0"
NODE_NAME="elasticsearch"
ES_JAVA_OPTS="-Xms512m -Xmx512m"
DISCOVERY_TYPE="single-node"
TRANSPORT_HOST="0.0.0.0"
ELASTIC_PASSWORD="${{secret(22, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}=="
ELASTIC_USERNAME="elastic"
ELASTICSEARCH_HOST="${{RAILWAY_PRIVATE_DOMAIN}}"
XPACK_SECURITY_ENABLED="true"
XPACK_SECURITY_HTTP_SSL_KEY="/usr/share/elasticsearch/config/certs/elasticsearch.key"
XPACK_SECURITY_HTTP_SSL_ENABLED="true"
XPACK_SECURITY_TRANSPORT_SSL_KEY="/usr/share/elasticsearch/config/certs/elasticsearch.key"
XPACK_SECURITY_HTTP_SSL_CERTIFICATE="/usr/share/elasticsearch/config/certs/elasticsearch.crt"
XPACK_SECURITY_TRANSPORT_SSL_ENABLED="true"
XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE="/usr/share/elasticsearch/config/certs/elasticsearch.crt"
XPACK_SECURITY_HTTP_SSL_CERTIFICATE_AUTHORITIES="/usr/share/elasticsearch/config/certs/ca.crt"
XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE_AUTHORITIES="/usr/share/elasticsearch/config/certs/ca.crt"
RAILWAY_RUN_UID="0"

# kibana railway variables
PORT="5601"
SERVER_NAME="kibana"
ELASTICSEARCH_HOSTS="https://${{Elasticsearch.RAILWAY_PRIVATE_DOMAIN}}:${{Elasticsearch.PORT}}"
ELASTICSEARCH_USERNAME="${{Elasticsearch.ELASTIC_USERNAME}}"
ELASTICSEARCH_PASSWORD="${{Elasticsearch.ELASTIC_PASSWORD}}"
ELASTICSEARCH_SSL_CERTIFICATEAUTHORITIES="config/certs/ca.crt"
XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY="${{secret(32, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+_")}}=="
SERVER_PUBLICBASEURL="https://${{Kibana.RAILWAY_PUBLIC_DOMAIN}}"
XPACK_SECURITY_ENABLED="${{Elasticsearch.XPACK_SECURITY_ENABLED}}"
RAILWAY_RUN_UID="0"

# logstash railway variables
RAILWAY_RUN_UID="0"
PORT="5044"
LS_JAVA_OPTS="-Xms512m -Xmx512m"
ELASTICSEARCH_HOSTS="https://${{Elasticsearch.RAILWAY_PRIVATE_DOMAIN}}:${{Elasticsearch.PORT}}"
ELASTICSEARCH_USERNAME="${{Elasticsearch.ELASTIC_USERNAME}}"
ELASTICSEARCH_PASSWORD="${{Elasticsearch.ELASTIC_PASSWORD}}"

# filebeat railway variables
RAILWAY_RUN_UID="0"
FB_JAVA_OPTS="-Xms512m -Xmx512m"
LOGSTASH_HOSTS="https://${{Logstash.RAILWAY_PRIVATE_DOMAIN}}:${{Logstash.PORT}}"


# Temp Generate Certs variables





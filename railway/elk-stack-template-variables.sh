# elasticsearch railway variables
PORT="9200"
http.host="0.0.0.0"
transport.host="0.0.0.0"
node.name="elasticsearch"
ES_JAVA_OPTS="-Xms512m -Xmx512m"
discovery.type="single-node"
ELASTIC_USERNAME="elastic"
ELASTIC_PASSWORD="${{secret(32, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/")}}=="
bootstrap.memory_lock="true"
xpack.security.enabled="false"
xpack.security.http.ssl.enabled="false"
xpack.security.transport.ssl.enabled="false"

# XPACK_SECURITY_ENABLED="true"
# XPACK_SECURITY_HTTP_SSL_ENABLED="true"
# XPACK_SECURITY_HTTP_SSL_KEY="/usr/share/elasticsearch/config/certs/elasticsearch.key"
# XPACK_SECURITY_HTTP_SSL_CERTIFICATE="/usr/share/elasticsearch/config/certs/elasticsearch.crt"
# XPACK_SECURITY_HTTP_SSL_CERTIFICATE_AUTHORITIES="/usr/share/elasticsearch/config/certs/ca.crt"
# XPACK_SECURITY_TRANSPORT_SSL_ENABLED="true"
# XPACK_SECURITY_TRANSPORT_SSL_KEY="/usr/share/elasticsearch/config/certs/elasticsearch.key"
# XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE="/usr/share/elasticsearch/config/certs/elasticsearch.crt"
# XPACK_SECURITY_TRANSPORT_SSL_CERTIFICATE_AUTHORITIES="/usr/share/elasticsearch/config/certs/ca.crt"
# RAILWAY_RUN_UID="0"

# kibana railway variables
PORT="5601"
server.name="kibana"
ELASTICSEARCH_HOSTS="https://${{Elasticsearch.RAILWAY_PUBLIC_DOMAIN}}"
ELASTICSEARCH_USERNAME="${{Elasticsearch.ELASTIC_USERNAME}}"
ELASTICSEARCH_PASSWORD="${{Elasticsearch.ELASTIC_PASSWORD}}"
xpack.encryptedsavedobjects.encryptionkey="${{secret(32, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+_")}}=="
server.publicbaseurl="https://${{Kibana.RAILWAY_PUBLIC_DOMAIN}}"
xpack.security.enabled="false"
# ELASTICSEARCH_SSL_CERTIFICATEAUTHORITIES="config/certs/ca.crt"
# RAILWAY_RUN_UID="0"


# logstash railway variables
# RAILWAY_RUN_UID="0"
PORT="5044"
LS_JAVA_OPTS="-Xms512m -Xmx512m"
ELASTICSEARCH_HOSTS="https://${{Elasticsearch.RAILWAY_PUBLIC_DOMAIN}}"
ELASTICSEARCH_USERNAME="${{Elasticsearch.ELASTIC_USERNAME}}"
ELASTICSEARCH_PASSWORD="${{Elasticsearch.ELASTIC_PASSWORD}}"

# filebeat railway variables
# RAILWAY_RUN_UID="0"
FB_JAVA_OPTS="-Xms512m -Xmx512m"
LOGSTASH_HOSTS="http://${{Logstash.RAILWAY_PRIVATE_DOMAIN}}:${{Logstash.PORT}}"


# Temp Generate Certs variables







# excute inner es01 container
docker exec -it multi-node-cluster-es01-1 sh

ELASTIC_PASSWORD="changeme"
curl -s \
  --cacert config/certs/ca/ca.crt \
  -u "elastic:${ELASTIC_PASSWORD}" \
  -H "Content-Type: application/json" \
  https://es01:9200/index-test-20250730



############################################## failed at Macos
export ES_URL="https://es01:9200/"
export API_KEY="create_at_kibana_ui"

# docker cp multi-node-cluster-es01-1:/usr/share/elasticsearch/config/certs/ca/ca.crt ./ca.crt

# test connection to Elasticsearch using the API key
# Send a test request to confirm your language client and Elasticsearch instance are up and running.
curl --cacert ./ca.crt "${ES_URL}/index-test-20250730" \
  -H "Authorization: ApiKey ${API_KEY}" \
  -H "Content-Type: application/json"



# Ingest Data
# Add data to your data stream or index to make it searchable
curl --cacert ./ca.crt -X POST "${ES_URL}/_bulk?pretty" \
  -H "Authorization: ApiKey ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d '
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "Snow Crash", "author": "Neal Stephenson", "release_date": "1992-06-01", "page_count": 470}
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "Revelation Space", "author": "Alastair Reynolds", "release_date": "2000-03-15", "page_count": 585}
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "1984", "author": "George Orwell", "release_date": "1985-06-01", "page_count": 328}
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "Fahrenheit 451", "author": "Ray Bradbury", "release_date": "1953-10-15", "page_count": 227}
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "Brave New World", "author": "Aldous Huxley", "release_date": "1932-06-01", "page_count": 268}
      { "index" : { "_index" : "index-test-20250730" } }
      {"name": "The Handmaid'"'"'s Tale", "author": "Margaret Atwood", "release_date": "1985-06-01", "page_count": 311}
  '



#Build your first search query
# Now you're ready to start experimenting with searching and performing aggregations on your Elasticsearch data.

curl --cacert ./ca.crt -X POST "${ES_URL}/index-test-20250730/_search?pretty" \
  -H "Authorization: ApiKey ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d '
    {
      "query": {
        "query_string": {
          "query": "snow"
        }
      }
    }
  '














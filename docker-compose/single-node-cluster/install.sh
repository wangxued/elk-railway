#!/bin/bash


########################################################## Install Elasticsearch and Kibana with Docker ##########################################################
# You can also use the hardened Wolfi image for additional security. Using Wolfi images requires Docker version 20.10.10 or higher.
# 你也可以使用加固的 Wolfi 镜像来增强安全性。使用 Wolfi 镜像需要 Docker 版本为 20.10.10 或更高。
# docker pull docker.elastic.co/elasticsearch/elasticsearch-wolfi:9.0.4


# 1. 创建 Docker 网络
docker network create elastic

# 2. 拉取 Elasticsearch 镜像
docker pull docker.elastic.co/elasticsearch/elasticsearch:9.0.4

# 3. Optional: Install Cosign for your environment. Then use Cosign to verify the Elasticsearch image’s signature.
# 可选：为您的环境安装 Cosign。然后使用 Cosign 验证 Elasticsearch 镜像的签名。

wget https://artifacts.elastic.co/cosign.pub
cosign verify --key cosign.pub docker.elastic.co/elasticsearch/elasticsearch:9.0.4

# The cosign command prints the check results and the signature payload in JSON format:
# cosign 命令以 JSON 格式打印检查结果和签名负载：
#
#
# Verification for docker.elastic.co/elasticsearch/elasticsearch:9.0.4 --
# The following checks were performed on each of these signatures:
#   - The cosign claims were validated
#   - Existence of the claims in the transparency log was verified offline
#   - The signatures were verified against the specified public key

# 4. Start an Elasticsearch container.
# 启动 Elasticsearch 容器。
docker run -it \
  --name es01 \
  --net elastic \
  -p 9200:9200 \
  -m 1GB \
  docker.elastic.co/elasticsearch/elasticsearch:9.0.4


# 5. Copy the generated elastic password and enrollment token. These credentials are only shown when you start Elasticsearch for the first time. You can regenerate the credentials using the following commands.
# 将生成的 elastic 密码和注册令牌复制。这些凭证仅在您首次启动 Elasticsearch 时显示。您可以使用以下命令重新生成这些凭证。

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

# We recommend storing the elastic password as an environment variable in your shell. Example:
# 我们建议将 elastic 密码存储为 shell 中的环境变量。示例：

export ELASTIC_PASSWORD="your_password"

# Copy the http_ca.crt SSL certificate from the container to your local machine.
# 将 http_ca.crt 的 SSL 证书从容器复制到您的本地机器。

docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .

# Make a REST API call to Elasticsearch to ensure the Elasticsearch container is running.
# 向 Elasticsearch 发起 REST API 调用以确保 Elasticsearch 容器正在运行。

curl --cacert http_ca.crt -u elastic:$ELASTIC_PASSWORD https://localhost:9200


################################################# Add more nodes  添加更多节点 #################################################
# Use an existing node to generate a enrollment token for the new node.
# 使用现有节点为新节点生成入会令牌。

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node

# The enrollment token is valid for 30 minutes.
# 入会令牌有效期为 30 分钟。

# Start a new Elasticsearch container. Include the enrollment token as an environment variable.
# 启动一个新的 Elasticsearch 容器。将注册令牌作为环境变量包含。

docker run -e ENROLLMENT_TOKEN="<token>" --name es02 --net elastic -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.0.4

# Call the cat nodes API to verify the node was added to the cluster.
# 调用 cat nodes API 以验证节点是否已添加到集群中。

curl --cacert http_ca.crt -u elastic:$ELASTIC_PASSWORD https://localhost:9200/_cat/nodes
################################################# Add more nodes  添加更多节点 #################################################


################################################# Run Kibana  运行 Kibana #################################################

# 1. Pull the Kibana Docker image.
# 拉取 Kibana Docker 镜像。
docker pull docker.elastic.co/kibana/kibana:9.0.4

# 2. Optional: Verify the Kibana image’s signature.
# 可选：验证 Kibana 镜像的签名。
wget https://artifacts.elastic.co/cosign.pub
cosign verify --key cosign.pub docker.elastic.co/kibana/kibana:9.0.4

# 3. Start a Kibana container.
# 启动 Kibana 容器。
docker run --name kib01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:9.0.4

# 4. When Kibana starts, it outputs a unique generated link to the terminal. To access Kibana, open this link in a web browser.
# 当 Kibana 启动时，它会在终端输出一个唯一的生成链接。要访问 Kibana，请在网络浏览器中打开此链接。

# 5. In your browser, enter the enrollment token that was generated when you started Elasticsearch.
# 在您的浏览器中，输入在启动 Elasticsearch 时生成的注册令牌。

# To regenerate the token, run:
# 要重新生成令牌，请运行：
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

# 6. Log in to Kibana as the elastic user with the password that was generated when you started Elasticsearch.
# 使用你在启动 Elasticsearch 时生成的 elastic 用户的密码登录 Kibana。

# To regenerate the password, run:
# 要重新生成密码，请运行：
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic


####################################### Remove containers  删除容器 #######################################
# To remove the containers and their network, run:
# 要删除容器及其网络，请运行：

# Remove the Elastic network
docker network rm elastic

# Remove Elasticsearch containers
docker rm es01
docker rm es02

# Remove the Kibana container
docker rm kib01


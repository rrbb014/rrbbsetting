#!/bin/bash

echo "===================================="
echo "=====  START FILEBEAT DOCKER  ======"
echo "===================================="

sudo docker run -p 9200:9200 docker.elastic.co/elasticsearch/elasticsearch:6.4.3



#!/bin/bash

echo "===================================="
echo "===    START ZOOKEEPER DOCKER    ==="
echo "===================================="

sudo docker run –p 2181:2181 zookeeper

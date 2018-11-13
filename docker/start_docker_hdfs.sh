#!/bin/bash

echo "===================================="
echo "=====     START HDFS DOCKER    ====="
echo "===================================="

sudo docker run --name hdfs -p 50070:50070 -p 50075:50075 -p 50090:50090 sequenceiq/hadoop-docker


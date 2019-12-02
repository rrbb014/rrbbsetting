#!/bin/bash

# Zookeeper

./zhk zk set /gauss/conf/hdfs/url=hdfs:50070
./zhk zk set /gauss/conf/ml/pred/api/backend=new
./zhk zk set /gauss/conf/ml/train/api/backend=new
./zhk zk set /gauss/conf/kafka/bootstrap/servers=broker:9092

# HDFS
sudo ./zhk hdfs mkdir /feedback

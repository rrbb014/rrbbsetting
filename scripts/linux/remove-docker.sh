#!/bin/bash

# 1. Cleanup
# clean up unused things
sudo docker system prune

# clean exited containers 
sudo docker rm $(sudo docker ps -qa --no-trunc --filter "status=exited")

# 2. Prepare 
# Stop all container
sudo docker rm -f $(sudo docker ps -qa --no-trunc)

# stop all stack
sudo docker stack rm $(sudo docker stack ls --format '{{.Name}}')

# stop all services
sudo docker service rm $(sudo docker service ls -q)

# remove all swarm nodes
sudo docker node rm -f $(sudo docker node ls -q)
sudo docker swarm leave -f 

# 3. Remove all volume, network, image
# remove all volumes
sudo docker volume rm -f $(sudo docker volume ls -qf dangling=true)

# remove all networks
sudo docker network rm $(sudo docker network ls -q)

# remove all images
sudo docker image rm $(sudo docker image ls -qa)


# Cleaning system
sudo apt-get purge -y docker docker.io docker-ce docker-ce-cli containerd.io
sudo apt-get autoremove -y --purge docker docker.io docker-ce docker-ce-cli containerd.io

sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo groupdel docker
sudo rm -rf /var/run/docker
sudo rm -rf /var/run/docker.sock


For my bad memory, i wrote execution commands

### Docker-compose

```bash
$ sudo docker-compose -f hdfs_zookeeper.yml up -d
```
It means that Booting up containers together using `hdfs_zookeeper.yml` file what pre-defined configurations.

And containers execute background(`-d`).

### docker 

In Older version. i execute each docker containers manually using start_***.sh files.

Again, for my bad memory, if assume situation that losted shell file, container can be executed by this command:

```bash
$ sudo docker run --name [container_name] --network="[host, overlay, etc]" -p [container_port:host_port] -p [another port:port] [image_name]
```

If want to access inside of container:

```bash
$ sudo docker exec -it [container_id] bash
```

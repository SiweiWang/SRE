#Run as a service
docker network create --driver overlay proxy

docker service create \
--name node-exporter \
--mode global \
--network proxy \
--mount "type=bind,source=/proc,target=/host/proc" \
--mount "type=bind,source=/sys,target=/host/sys" \
--mount "type=bind,source=/,target=/rootfs" \
prom/node-exporter:0.12.0 \
-collector.procfs /host/proc \
-collector.sysfs /host/sys \
-collector.filesystem.ignored-mount-points \
"^/(sys|proc|dev|host|etc)($|/)"

docker service create --name cadvisor \
--mode global \
--network proxy \
--mount "type=bind,source=/,target=/rootfs" \
--mount "type=bind,source=/var/run,target=/var/run" \
--mount "type=bind,source=/sys,target=/sys" \
--mount "type=bind,source=/var/lib/docker,target=/var/lib/docker" \ google/cadvisor:v0.24.1

docker service create --name prometheus \
--network proxy \
-p 9090:9090 \
--constraint " node.labels.env == jenkins-master " \
--mount "type=bind,source=/conf/prometheus.yml,target=/etc/prometheus/prometheus.yml" \
--mount "type=bind,source=/home/vagrant/prometheus,target=/prometheus" prom/prometheus:v1.2.1

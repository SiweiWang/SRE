#!/bin/bash

jenkins_master_node=app1
# tag master
docker node update --label-add env=jenkins-master ${jenkins_master_node}

#tag work node
docker node update --label-add env=jenkins-agent app2
docker node update --label-add env=jenkins-agent app3

# create salve

echo "admin" | docker secret create jenkins_user -
echo "admin" | docker secret create jenkins_user -

export JENKINS_IP=app1

docker stack deploy -c jenkins-swarm-agent-secrets.yml jenkins
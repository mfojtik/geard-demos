#!/bin/sh
#
# Prepare Wordpress and Mysql for demo
#
docker pull tutum/mysql
docker pull wordpress
docker pull openshift/centos-haproxy-simple-balancer

pushd ./images/mysql >/dev/null
  docker build -t demo/mysql .
popd >/dev/null

pushd ./images/wordpress >/dev/null
  docker build -t demo/wordpress .
popd >/dev/null

gear purge
sleep 3
systemctl restart geard

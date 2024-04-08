#!/bin/bash
set -e

echo Start

echo remove previous data...
rm -rf data data-slave

echo stop containers...
docker-compose stop
docker-compose rm -f

echo starting master node...
docker-compose up -d postgres_master
sleep 40s

echo initializing master...
docker exec -it postgres_master sh /etc/postgresql/init-script/init.sh
sleep 20s

echo restart master node...
docker-compose restart postgres_master
sleep 40s

echo start slave node...
docker-compose up -d  postgres_slave
sleep 40s

echo start pgpool...
docker-compose up -d  pgpool
sleep 40s

echo Done

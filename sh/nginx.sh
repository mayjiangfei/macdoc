#!/bin/bash

nginxId=$(docker inspect --format='{{.Id}}' nginx)

docker exec -it ${nginxId} /bin/bash
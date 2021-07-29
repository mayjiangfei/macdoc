#!/bin/bash

phpId=$(docker inspect --format='{{.Id}}' php)

docker exec -it ${phpId} /bin/bash
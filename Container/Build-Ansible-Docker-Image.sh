#!/bin/bash
#
# Here we Generate
ssh-keygen -q -t rsa -N '' -f "$(pwd)"/id_rsa <<<y 2>&1 >/dev/null
docker build -t docker-ansible . --no-cache

#Run the image as daemon with $docker run --rm -itd --name test-ansible docker-ansible

#Access the container with $docker exec -it test-ansible /bin/sh

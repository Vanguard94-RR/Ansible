#!/bin/bash
#
# Here we Generate the rsa keys used to login
ssh-keygen -q -t rsa -N '' -f "$(pwd)"/id_rsa_ans_lab <<<y 2>&1 >/dev/null

docker-compose up --build --detach

#docker build -t ans/alpine/controller . --no-cache

#Run the image as daemon with $docker run --rm -itd --name ans-alp-controller ans/alpine/controller

#Access the container with $docker exec -it ans-alp-controller /bin/sh

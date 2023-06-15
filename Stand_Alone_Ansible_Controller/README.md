# ANSIBLE CONTROLLER IN ALPINE CONTAINER

If you are looking for a quick Ansible controller in a lightweight container image, this repository contains an Ansible controller on an Alpine Linux Image.

## ""

### Prerequisite

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Setup

This repo is intended to setup 1 controller node capable to comunicate to your local network and interact with other hosts.

| NODE TYPE  |    IMAGE    |  IMAGE NAME  | CONTAINER NAME | NETWORK | NETWORK MODE |
| :--------: | :---------: | :----------: | :------------: | :-----: | :----------: |
| controller | alpine:3.14 | ans/alp/ctrl |    ans-ctrl    | default |    bridge    |

Image and container configuration can be found in `docker-compose.yml` file.

### Deploy

Clone the repository to your machine.

```sh
    $ <Pending> 
```

Run the following command which will start pulling the base image's and build the containers.

```sh
    $ cd Stand_Alone_Ansible_Controller
    $ ./Build-Ansible-Docker-Image.sh
    
    or manually execute

    $ docker-compose up --build --detach --no-cache
```

### Authentication

User named `ansuser` will be created on the node with passwordless sudo privilige. Both the `root` and `ansuser` password is set to `asdf`.

To connect to the controller node run the following command.

```sh
    $ docker container exec -it ans-alp-controller /bin/bash
```

<!--- (Password based authentication is also enabled. You need the IP address to SSH into the container.

```sh
    $ docker network inspect anslab
    $ ssh ansuser@IPaddress
```

### Bootstrap Script

In the controller node ansible package should be installed and it will be taken care by `script/bootstrap.sh`.

From the controller node SSH Keypair needs to be generated and distributed to all nodes for ansible to communicate. This will also be taken by `script/bootstrap.sh` script which is already copied to `/home/ansuser` in anscontroller node.

```sh
    $ docker container exec -it anscontroller sh
    $ su - ansuser
    $ bash /home/ansuser/bootstrap.sh
```
-->
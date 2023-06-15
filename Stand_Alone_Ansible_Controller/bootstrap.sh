#!/usr/bin/env bash

# Generate keypair and distribute it to controller and managed node so ansuser can run playbooks using the keys
ssh-keygen -b 2048 -t rsa -f /home/ansuser/.ssh/id_rsa -q -N ""

for host in host1 host2; do
        echo "++ Copying Key to ${host}"
        sshpass -p 'asdf' ssh-copy-id -o "StrictHostKeyChecking=no" ansuser@$host
done

# Ansible.cfg file
echo -e "++ Generating ansible.cfg file\n"
echo -e "[defaults]
inventory = hosts
host_key_checking = False
nocows = 1" >ansible.cfg

# Hosts file
echo -e "++ Generating inventory file\n"
echo -e "[servers]
ans-ctrl" >hosts

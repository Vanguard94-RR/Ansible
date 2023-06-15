FROM alpine:3.14

RUN apk add coreutils openrc

# RUN apk update 

RUN apk add --no-cache --update curl shadow sudo jq gcc vim wget linux-headers python3 py3-pip git libffi-dev supervisor openssh openssh-server openssl-dev bash

RUN rc-update add sshd
RUN apk add ansible

RUN mkdir -p /root/Ansible

COPY id_rsa_ans_lab.pub /root/.ssh/id_rsa_ans_lab.pub
COPY id_rsa_ans_lab /root/.ssh/id_rsa_ans_lab

RUN cat /root/.ssh/id_rsa_ans_lab.pub > /root/.ssh/authorized_keys 
RUN chmod 600 -R /root/.ssh/ 

# Create ANSUSER, .ssh directory and set ownsership,permission
RUN adduser -D ansuser -s /bin/bash -G wheel \
    && echo "ansuser ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers \
    && mkdir -p /var/run/sshd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Set root user and ansuser password
RUN echo "root:asdf" | chpasswd
RUN echo "ansuser:asdf" | chpasswd
RUN usermod -s /bin/bash root

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

# Create credentials to ANSUSER to be able to ssh in to the container
SHELL ["/bin/bash", "-c"]


RUN ["/bin/bash", "-c", "su - ansuser"]

RUN ["/bin/bash", "-c", "mkdir -p /home/ansuser/.ssh"]

RUN ["/bin/bash", "-c", "ssh-keygen -b 2048 -t rsa -f /home/ansuser/.ssh/id_rsa -q -N '' <<<y 2>&1 >/dev/null"]

RUN ["/bin/bash", "-c", "ls /home/ansuser/.ssh/"]

RUN ["/bin/bash", "-c", "cd home/ansuser/.ssh/; ssh-keygen -A"]

# RUN ["/bin/bash", "-c", "/usr/sbin/sshd -D"]

EXPOSE 22 

CMD ["/usr/bin/supervisord","-n"]

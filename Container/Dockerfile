FROM alpine:3.14

ENV TZ=Americas/Mexico_City

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apk add coreutils openrc

# RUN cat > /etc/apk/repositories << EOF; $(echo)\
#     https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/\
#     https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/\
#     https://dl-cdn.alpinelinux.org/alpine/edge/testing/\
#     EOF
RUN apk update 
RUN apk upgrade
RUN apk add --no-cache --update curl gcc vim linux-headers python3 py3-pip git libffi-dev supervisor coreutils openssh openssh-server openssl-dev bash

RUN rc-update add sshd
RUN apk add ansible

RUN mkdir -p /root/Ansible

COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY id_rsa /root/.ssh/id_rsa 

RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys 
RUN chmod 600 -R /root/.ssh/ 
# RUN service sshd start

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
EXPOSE 22 
CMD ["/usr/bin/supervisord","-n"]
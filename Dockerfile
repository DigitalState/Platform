FROM williamyeh/ansible:alpine3

COPY config/ssh /root/.ssh

RUN chmod 600 /root/.ssh/*

WORKDIR /etc/ansible

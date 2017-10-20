FROM williamyeh/ansible:alpine3

RUN mkdir -p /root/.ssh

COPY config/ssh /root/.ssh

RUN chmod -R 600 /root/.ssh

RUN mkdir -p /srv/resource /srv/service /srv/spa

WORKDIR /etc/ansible/env/lab

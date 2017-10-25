FROM williamyeh/ansible:alpine3

RUN mkdir -p /root/.ssh

# The ssh directory is copied over, instead of being mounted as a volume, due to an ssh key permissions requirement by openssl.
COPY sdk/ssh /root/.ssh

RUN chmod -R 600 /root/.ssh

RUN mkdir -p /srv/resource /srv/service /srv/spa

WORKDIR /etc/ansible/env/lab

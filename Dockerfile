FROM williamyeh/ansible:alpine3

RUN mkdir -p /root/.ssh

# The ssh directory is copied over instead of being mounted as a volume due to a permission issue.
# (Mounting a volume makes the file permissions too wide and open-ssl complains)
COPY config/ssh /root/.ssh

RUN chmod -R 600 /root/.ssh

RUN mkdir -p /srv/resource /srv/service /srv/spa

WORKDIR /etc/ansible/env/lab

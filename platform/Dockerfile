FROM alpine:3.6

RUN \
    # Sudo
    apk --update add sudo && \

    # SSH client
    apk --update add sshpass openssh-client rsync && \

    # Python
    apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi && \

    # Ansible
    pip install ansible && \

    # Clean up
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

WORKDIR /etc/ansible/env/lab

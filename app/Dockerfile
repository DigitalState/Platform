FROM alpine:3.8

# SUDO
RUN apk --update add sudo

# BASH
RUN apk --update add bash

# SSH server
RUN apk --update add --no-cache openssh && \
    sed -i "s/#PermitRootLogin.*/PermitRootLogin\ yes/g" /etc/ssh/sshd_config && \
    sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config && \
    sed -i "s/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g" /etc/ssh/sshd_config && \
    sed -i "s/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g" /etc/ssh/sshd_config && \
    sed -i "s/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g" /etc/ssh/sshd_config && \
    sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g" /etc/ssh/sshd_config && \
    sed -i "s/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g" /etc/ssh/sshd_config

# Keys
RUN ssh-keygen -A

# PHP
RUN apk --update add php7 php7-fpm && \
    apk --update add php7-opcache php7-dom php7-curl php7-json php7-phar php7-openssl php7-mbstring php7-ctype php7-session php7-xml php7-xmlwriter php7-tokenizer curl

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer  --install-dir=/usr/bin --version=1.0.0 && \
    composer global require "hirak/prestissimo:^0.3"

# ROOT password
RUN echo "root:root" | chpasswd

# Clean up
RUN rm -rf /var/cache/apk/*

RUN mkdir /root/tests

WORKDIR /root/tests

COPY ["behat.yml", "composer.json", "composer.lock", "/root/tests/"]

COPY ["features", "/root/tests/features"]

RUN composer install

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

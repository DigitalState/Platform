FROM alpine:3.8

RUN \
    # Sudo
    apk --update add sudo && \

    # Bash
    apk --update add bash && \

    # SSH server
    apk --update add --no-cache openssh && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/g' /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config && \

    # Keys
    ssh-keygen -A && \

    # ROOT password
    echo "root:root" | chpasswd && \

    # Clean up
    rm -rf /var/cache/apk/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

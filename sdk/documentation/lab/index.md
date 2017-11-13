# Lab Environment

The lab environment enables the developer to run the full DigitalState stack on a local machine as a dockerized application.

It also provides useful developer shortcuts to help manage multiple containers at once.

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows) / for [Mac](https://docs.docker.com/docker-for-mac) / for [Linux](https://docs.docker.com/engine/installation/#server)) on your local machine.

2. Download this repository.

3. Open a console and make it point to the root of the repository directory:

   ```
   cd C:\Users\Demo\Sdk
   ```

4. Boot the SDK container:

   ```
   docker-compose up -d
   ```

5. Confirm the container has been booted successfully:

   ```
   docker ps
   ```
   
   You should see the following output:
   
   ```
   CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
   4ceab8511b85        sdk_sdk             "/bin/sh"           3 seconds ago       Up 2 seconds                            sdk
   ```

6. Enter the container in console mode:

   ```
   docker exec -it sdk /bin/sh
   ```

7. Point to the lab environment directory:

    ```
    cd /etc/ansible/env/lab
    ```

At this point, you have the SDK container running on your local machine as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

## Configuration

The lab environment makes use of an Ansible inventory file found [here](/sdk/ansible/env/lab/inventory.yml) to describe the host server, general configurations and each enabled microservices.

For the lab environment, the host server is configured to localhost. This means Ansible will run commands against the container itself and deploy the dockerized application on your local machine.

<pre>
...
    hosts:
        server:
            ansible_connection: <b>local</b>
...
</pre>

Afterwards, you will find general configurations.

<pre>
...
        env: <b>lab</b>                                            # The current environment. This configuration is used by Ansible playbooks.

        directory: <b>~</b>                                        # The application directory path.

        jwt_private_key: <b>/root/resource/jwt/lab/key</b>         # The jwt private key path.
        jwt_public_key: <b>/root/resource/jwt/lab/key.pub</b>      # The jwt public key path.
        jwt_key_pass_phrase: <b>~</b>                              # The jwt key password phrase.

        data: <b>dev</b>                                           # The database data fixtures to load.
...
</pre>

**Note:** Ansible runs within the SDK container, meaning all file and folder path configurations are based on the SDK container filesystem and **not** the local machine filesystem. The SDK container mounts the **C:\Users\Demo\Sdk\resource** directory to **/root/resource**. Therefore, in the example above, the jwt private key path is set to **/root/resource/jwt/lab/key** and not **C:\Users\Demo\Sdk\resource\jwt\lab\key**

Finally, you will find the list of each microservices.

<pre>
...
        authentication: <b>enabled</b>                             # Whether the microservice is enabled or not.
        <b></b>                                                    # To disable, place a ~.
        authentication_version: <b>develop</b>                     # The repository branch to download.
        authentication_host: <b>api.authentication.ds</b>          # The host name for the microservice.
...
</pre>

## Commands

Below is the full list of available commands:

- [Deploy](deploy.md)
- System
    - [Setup](system/setup.md)
- Repository
    - [Download](repository/download.md)
    - [Override](repository/override.md)
- JWT
    - [Download](jwt/download.md)
    - [Configure](jwt/download.md)
- Proxy
    - Container
        - [Up](proxy/container/up.md)
        - [Down](proxy/container/down.md)
        - [Stop](proxy/container/stop.md)
- Container
    - [Up](container/up.md)
    - [Down](container/down.md)
    - [Stop](container/stop.md)
    - Env
        - [Configure](container/env/configure.md)
- Database
    - [Migrate](database/migrate.md)
    - Data
        - [load](database/data/load.md)
- Cache
    - [Clear](cache/clear.md)
    - [Warmup](cache/warmup.md)
- Config
    - [Set](config/set.md)
    - Api
        - [Configure](config/api/configure.md)

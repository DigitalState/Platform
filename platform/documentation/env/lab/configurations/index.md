# Lab Environment

## Configurations

The lab environment uses an Ansible inventory file found [here](/platform/ansible/env/lab/inventory.yml) to describe the host server, general configurations and each enabled microservices.

For this environment, the host server is configured to localhost. This means Ansible will run commands against the container itself and deploy the dockerized application on your local machine.

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
        env: <b>lab</b>                                            # The current environment.

        directory: <b>~</b>                                        # The application directory path.

        jwt_private_key: <b>/root/resource/jwt/lab/key</b>         # The jwt private key path.
        jwt_public_key: <b>/root/resource/jwt/lab/key.pub</b>      # The jwt public key path.
        jwt_key_pass_phrase: <b>~</b>                              # The jwt key password phrase.

        data: <b>dev</b>                                           # The database data fixtures to load.
...
</pre>

> **Note:** 
> Ansible runs within the platform container, meaning all file and folder path configurations are based on the platform container filesystem and **not** the local machine filesystem. 
> The platform container mounts the **C:\Users\Demo\Platform\resource** directory to **/root/resource**. Therefore, in the example above, the jwt private key path is set to **/root/resource/jwt/lab/key** and not **C:\Users\Demo\Platform\resource\jwt\lab\key**

Finally, you will find the list of each microservices.

<pre>
...
        authentication: <b>enabled</b>                             # Whether the microservice is enabled or not.
        <b></b>                                                    # To disable, place a ~.
        authentication_version: <b>develop</b>                     # The repository branch to download.
        authentication_host: <b>api.authentication.ds</b>          # The host name for the microservice.
...
</pre>

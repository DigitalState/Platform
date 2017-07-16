# Setup (Linux / macOS)

- Uncomment the MicroServices you wish to install in `Sdk/develop/config/repositories.ini`
    - Initially, uncomment `authentication, identities, services, formio and camunda`.
    - Note that the Services MS is currently using the Formio instance running at http://45.79.141.45:8056, so the `formio` container is not required at the moment.

- From the `Sdk/develop` directory run the following to make the setup scripts executable:
```
chmod +x setup.sh update.sh
```
Note that `setup.sh` deletes and re-downloads all uncommented repos every time it runs. It backs up existing repos to `/tmp/ms_graveyard`, so watch your disk space. 

- To install and run the Docker containers, execute `setup.sh` passing the absolute path to the deployment target directory (It defaults to `/var/containers` if not provided). Note that Admin and Portal require a very long time to download and compile their dependencies. 
```
./setup.sh {deployment_directory}

```

- Ensure all the PHP containers are running:
```
docker ps

```

- Now run update.sh to update the dependencies of the MicroServices, apply migrations and load fixtures:
```
./update.sh {deployment_directory}

```

- It's a good idea to watch the container logs of Admin and Portal to monitor their installation progress in separate terminal windows:
```
docker logs -f admin_ng2admin_1 
docker logs -f portal_ng2admin_1
```

- Now you should be able to access the UI at:
    - Admin: http://localhost:8001
        - Username: admin@digitalstate.ca
        - Password: 1
        
    - Portal: http://localhost:8000
        - Username: morgan@site.com
        - Password: 1

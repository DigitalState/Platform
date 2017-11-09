# Development Environment

1. Create SSH key pair:

   ```
   ssh-keygen -f key
   ```

2. Copy SSH key pair (key and key.pub) to `config/ssh/dev` folder.

3. Establish trusted SSH connection between the SDK container and the remote development server:

   ```
   ssh-copy-id -i ~/.ssh/dev/key root@ip
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

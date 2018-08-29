Now that the dockerized application is up and running, it is time to test it!

- Portal UI: http://portal.lab.ds/ (Username: morgan@individual.ds / Password: morgan)
- Admin UI: http://admin.lab.ds/ (admin@staff.ds / admin)
- Formio: http://api.formio.lab.ds/ (admin@staff.ds / admin)
- Camunda: http://api.camunda.lab.ds/camunda
- Postman: [collection](/resource/postman/collection.json) / [environment](/resource/postman/env/lab.json)

> The DigitalState architecture is essentially a collection of business-focused microservices, all exposing various APIs to create, read, update, and delete data or achieve certain goals.

In order to interact with the API, we suggest using an API gui tool, such as [Postman](https://www.getpostman.com/) (use the desktop version, and **not** the Chrome version). The platform provides a pre-made Postman [collection file](../../../resource/postman/collection.json) mapping all microservices API endpoints and an [environment file](../../../resource/postman/env/lab.json) ready to be imported. Here are the instructions on how to import [collections](https://www.getpostman.com/docs/postman/collections/creating_collections) and [environments](https://www.getpostman.com/docs/postman/environments_and_globals/manage_environments) in Postman.

After importing the files, a new collection titled "DigitalState" will appear on the left and a new environment titled "DigitalState Lab" will appear in the dropdown top right.

As a first test, we will **login** as a Staff user and **query** the list of users in the system.

> The application comes with data fixtures that are loaded on first deploy as demo data. These data fixtures includes a few Business Units, Staff and Individual users, among other things.

Under the "DigitalState" collection, navigate to `Authentication -> Login -> /tokens/staff`. Also, select the "DigitalState Lab" environment. Click the "Send" button. This action simulates a login by sending pre-configured user credentials to the authentication microservice and return a jwt token on success:

```
{
    "token": "abc..."
}
```

Once a token is obtained, it can be used to access any other protected API endpoints that requires user authentication. Typically, you would need to copy this token to your clipboard and paste it in the next API query you wish to make in Postman. However, our Postman collection has been programmed to keep track of the last logged in user and use the current token on subsequent API requests automatically.

Next, nagivate to `Authentication -> User -> GET /users`. Click the "Send" button. This action will send a GET request to users API endpoint and return a list of users:

```
[
    {
        "id": 1,
        ...
    },
    {
        "id": 2,
        ...
    },
    ...
]
```

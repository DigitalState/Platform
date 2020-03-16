# General

A set of custom fixtures has been added to the Platform repository and can be found at `https://github.com/DigitalState/Platform/tree/release/0.18.0/app/fixtures`. In this particular example, the fixtures directory was named `custom`, but could be named whatever fits the context.

These fixtures contains a complete set data for each entities, including each possible states, found in the DigitalState architecture.


# Using Custom Fixtures

The custom fixtures can be loaded into each microservice databases by configuring the Ansible inventory correctly and running a couple of Ansible commands.

## Inventory Configuration

In order to indicate Ansible to use the custom fixtures instead of the dev fixtures, a configuration named `fixture` found in the inventory file `ansible/env/dev/vars/app.yml#11` should be set to `custom`.

## Copy Fixtures

After indicating Ansible to use the custom fixtures, an Ansible command needs to be ran to copy the custom fixtures  directories to each microservices.

`ansible-playbook -i inventory.yml app/database/fixture/create.yml`

This command will copy each custom fixtures subdirectories (`custom/assets/*`, `custom/authentication/*`, `...`) to each microservices fixtures designated directory (`/app/srv/assets/api/config/fixtures/custom/*`, `...`)

## Load Fixtures

Once the custom fixtures are present in each microservices, an Ansible command can be ran to actually load the yaml-based fixtures into each microservices databases.

`ansible-playbook -i inventory.yml app/database/fixture/load.yml`

Since the `fixture` configuration is set to `custom`, Ansible will use the `custom` directory of fixtures found at `/app/srv/assets/api/config/fixtures/custom`, instead of the default `dev` directory found at `/app/srv/assets/api/config/fixtures/dev`.


# Data Summary

This section contains a summary and description of the important data found in the custom fixtures.

## Tenants

Tenant (5a5dc71c-8f08-476f-b192-106637717974)

The default tenant.

## Business Units

Administration (9df65eca-1e81-475b-8584-df6c357edf30)

The Administration is a business unit meant to own administrative-level data. Such data includes configurations, metadata, access and permissions, business units, roles, etc.

Only priviledged users such as administrators have full access to data owned by the Administration business unit.

Backoffice (1efc9d23-111a-4f9a-b703-29df95e38a7e)

The Backoffice is a business unit meant to own general-purpose data. Such data includes individuals and organizations, services, scenarios, submissions and any derived data such as cases, records, tasks, etc.

Only priviledged users such as staff members have full access to data owned by the Backoffice business unit. Some users such as individuals and organizations may have read access.

Technically, the Backoffice business unit could be divided into a more refined collection of business units, such as Environment, Construction, etc. However, to keep fixtures simple, only a wide Backoffice business unit is included.

Portal (3709635c-5ab1-487b-84ea-23b6e282cc4d)

The Portal is a business unit meant to own website-related data. Such data includes pages, texts, etc. This business unit is a perfect example of a more fine-grained categorization of owned data.

Only priviledged useds such as staff members have full access to data owned by the Portal business unit. Some users such as anonymous, individuals and organizations have read access.

# Roles

Administrator (df31fa91-26d9-4ed8-a0f4-6aecc4252c57)

The Administrator role gives read-write permissions to data owned by any business units.

Manager (81330e07-6bdd-46a3-af8b-85553537c1fd)

The Manager role gives read-write permissions to data owned by the Backoffice and Portal business units. The roles permissions are inherited from dynamic access cards with the Backoffice and Portal business units associated.

Backoffice Manager (d8bb8807-4a64-4515-b16a-198c2e63cafc)

The Backoffice Manager role gives read-write permissions to data owned by the Backoffice business unit. The roles permissions are inherited from static access cards with the Backoffice business unit hardcoded.

Staff (ea27f3ad-8dec-4d5c-880a-758c7fbafd66)

The Staff role gives read permissions to data owned by the Backoffice and Portal business units. The roles permissions are inherited from dynamic access cards with the Backoffice and Portal business units associated.

Backoffice Agent (2217da69-b489-4938-b5f9-91fafda30f9f)

The Backoffice Agent role gives read permissions to data owned by the Backoffice business unit. The roles permissions are inherited from static access cards with the Backoffice business unit hardcoded.

Individual (344e62b9-d797-4285-ad49-ad95f93654e1)

The Individual role gives read-write permissions to certain data owned by the Backoffice and Portal business units. The roles permissions are inherited from static access cards with the Backoffice and Portal business units associated.

Organization (185330d2-9209-4714-92ee-60cdf29d1745)

The Organization role gives read-write permissions to certain data owned by the Backoffice and Portal business units. The roles permissions are inherited from static access cards with the Backoffice and Portal business units associated.

# Identities

System (1d14cd3f-72cc-444b-8dc7-bbdba4815536)

The System identity has direct access and permissions assigned. Its purpose is for cross-microservice communications. Login is disabled and its jwt token is only generated internally.

Admin (6c344b4b-78d3-47c4-9d8b-e67217f46569)

The Admin identity has the Admin role. It's purpose is to manage system configurations, business units, roles, etc.

Elliot (e9f3a831-048f-4cd3-92bf-2c77e6d34d1d)

Elliot holds a manager position and has the Manager role. His purpose is to manage users, services, scenarios across business units.

Devon (7281ef76-be00-42e4-ab67-fc7e0cc2e7ef)

Devon holds a manager position and has the Backoffice Manager role. His purpose is to manage users, services, scenarios from the Backoffice business unit.

Remy (38bf092a-b807-438f-8cc9-009fc12924cb)

Remy holds a staff position and has the Staff role. His purpose is to review submissions, cases, records across business units.

Blair (3e94c60b-34c8-4355-91c9-4b246504f110)

Blair holds an staff position and has the Backoffice Staff role. His purpose is to review submissions, cases, records from the Backoffice business unit.

Morgan (2af16e03-bbce-4ec9-b73f-8f0468a93f4b)

Morgan is an invidivual and has the Individual role. His purpose is to browse services and submit scenario submissions.

Acme (5946a069-95d4-4536-9f78-41ca96316cc5)

Acme is an organization and has the Organization role. Its purpose is to browse services and submit scenario submissions.


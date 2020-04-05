Create a role that has Read permission on case and case status entities that belongs to Business units.

`POST {identities}/roles`

```
{
	"owner": "BusinessUnit",
	"ownerUuid": "c11c546e-bd01-47cf-97da-e25388357b5a",
	"title": {
		"en": "Auditor",
		"fr": "Auditeur"
	},
	"slug": "auditor",
	"permissions": {
		"cases": [
			{
				"scope": {
					"type": "owner",
					"entity": "BusinessUnit",
					"entityUuid": "*"
				},
				"permissions": [
					{
						"key": "case",
						"attributes": ["BROWSE", "READ"]
					},
					{
						"key": "case_property",
						"attributes": ["BROWSE", "READ"]
					},
					{
						"key": "case_status",
						"attributes": ["BROWSE", "READ"]
					},
					{
						"key": "case_status_property",
						"attributes": ["BROWSE", "READ"]
					}
				]
			}
		]
	},
	"version": 1
}
```

The role `b5ebefe1-b5fa-4b74-9c32-2563f56b99ff` created above is considered dynamic (`"entityUuid": "*"`).

This means the role itself doesn't grant any Read access on cases just yet because it requires a role<->business_unit relation as well.

This dynamic mechanism is what enables reusability of roles without having to define hard-coded access permissions (``"entityUuid": "a9d68bf7-5000-49fe-8b00-33dde235b327"`).

Create a role<->business_unit relation. This grants the individual Morgan the Auditor role on business unit `Administration`.

`POST {identities}/individual_roles`

```
{
	"owner": "BusinessUnit",
	"ownerUuid": "a9d68bf7-5000-49fe-8b00-33dde235b327",
	"individual": "/individuals/d0daa7e4-07d1-47e6-93f2-0629adaa3b49",
	"role": "/roles/b5ebefe1-b5fa-4b74-9c32-2563f56b99ff",
	"businessUnits": [
		"/business_units/a9d68bf7-5000-49fe-8b00-33dde235b327"
	],
	"version": 1
}
```

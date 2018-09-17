@enterprise @tenants @api @tenant @add
Feature: Add tenants
  In order to add tenants
  As a system identity
  I should be able to send api requests related to tenants

  Background:
    Given I am authenticated as the "system" user

  @upMigrations @loadFixtures
  Scenario: Add a tenant
    When I add "Accept" header equal to "application/json"
    And I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "http://api.tenants.ci.ds/app_test.php/tenants" with body:
    """
    {
      "uuid": "8fd282bc-d752-4a6e-8eef-e78ce496e0f1",
      "title": {
        "en": "Title - add",
        "fr": "Titre - add"
      },
      "version": 1
    }
    """
    Then the response status code should be 201
    And the header "Content-Type" should be equal to "application/json; charset=utf-8"
    And the response should be in JSON

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.assets.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.authentication.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.cases.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.cms.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.forms.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.identities.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.records.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.services.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.tasks.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

  @downMigrations
  Scenario: Read the added tenant
    When I add "Accept" header equal to "application/json"
    And I send a "GET" request to "http://api.tenants.ci.ds/app_test.php/system/tenants/8fd282bc-d752-4a6e-8eef-e78ce496e0f1"
    Then the response status code should be 200

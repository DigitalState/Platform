@enterprise @tenants @api @tenant @add
Feature: Add tenants
  In order to add tenants
  As a system identity
  I should be able to send api requests related to tenants

  @upMigrations @loadFixtures @downMigrations
  Scenario: Add a tenant
    When I add "Accept" header equal to "application/json"
    And I add "Content-Type" header equal to "application/json"
    And I send a "POST" request to "http://api.tenants.ci.ds/app_test.php/tenants" with body:
    """
    {
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

Feature: Navigate app filesystem

  Scenario: Listing all app directories and files
    Given I am in a directory "/srv"
    When I run "ls"
    Then I should get:
      """
      VERSION
      assets
      authentication
      camunda
      cases
      cms
      discovery
      formio
      forms
      identities
      proxy
      records
      services
      """

Feature: Navigate app filesystem

  Scenario: Listing all app directories and files
    Given I have a console at "/srv"
    When I run the command "ls"
    Then I should get the following output:
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

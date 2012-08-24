@account_required @domain_required
Feature: Existing Domain Operations

  Background:
    Given the libra client tools
    And an existing domain

  Scenario: Domain Update
    When domain is updated
    Then the domain should be reserved

  Scenario: Domain Show
    When rhc domain is run
    When rhc domain show is run
    Then the default domain action output should equal the show action output

  Scenario: Domain Create Fails
    When rhc domain create is called
    Then the domain command should fail with an exitcode of 128

  Scenario: Domain Delete
    When domain is deleted
    Then domains should be empty

  Scenario: Domain Update Fails
    When domain is deleted
    When domain is updated
    Then the domain command should fail with an exitcode of 127

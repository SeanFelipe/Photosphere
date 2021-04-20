Feature: Demo tasks API side

  Scenario: Load test description into Photosphere spec via API
    Given I have Photosphere API server ready for connections
    When I post a new spec
    Then I receive a 200 response with a spec id

  Scenario: Add test execution history to a spec
    Given I pull the list of specs and note the id of the first
    When I post a new run record to the spec with a unique hash
    And I pull the spec id again
    Then the spec run records contains the most recent with unique hash

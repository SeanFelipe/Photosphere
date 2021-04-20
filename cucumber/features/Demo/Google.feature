Feature: Google assertions

  Scenario: Google page should say Google
    When I load google.com
    Then the page contains "Google"
    And does not contain "Bing" or "Yahoo"

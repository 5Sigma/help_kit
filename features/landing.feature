Feature: HelpKit landing page
  Scenario: lands with no articles
    When user lands
    Then user should see 0 articles

  Scenario: Lands with articles
    Given an article
    When user lands
    Then user should see 1 popular article
    And user should see 1 recent article



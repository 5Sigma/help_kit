Feature: Article browsing
  Scenario: view an existing article
    Given an article
    When a guest views an article
    Then a guest should see the article content
  Scenario: admin creates a new article
    Given a logged in admin user
    When admin creates a new article
    Then admin should see article content
  Scenario: admin updates article
    Given a logged in admin user
    And an article
    When admin updates article content
    Then admin should see updated article content
  Scenario: admin views a category
    Given a logged in admin user
    And an article
    When guest views a category
    Then guest should see 1 article





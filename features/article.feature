Feature: Article browsing
  @wip
  Scenario: view an existing article
    Given an article
    When a guest views an article
    Then a guest should see the article content

  @javascript
  Scenario: admin creates a new article
    Given a logged in admin user
    When admin creates a new article
    Then admin should see article content

  @javascript
  Scenario: admin updates article
    Given a logged in admin user
    And an article
    When admin updates article content
    Then admin should see updated article content

  Scenario: admin deletes an article
    Given a logged in admin user
    And an article
    When admin deletes an article
    Then should see flash message "Article deleted"

  Scenario: Guest views a category
    Given a logged in admin user
    And an article
    When guest views a category
    Then guest should see 1 article

  Scenario: admin publishes an article
    Given a logged in admin user
    And an unpublished article
    When admin publishes an article
    Then should see flash message "Article published"

  Scenario: admin unpublishes an article
    Given a logged in admin user
    And an published article
    When admin unpublishes an article
    Then should see flash message "Article unpublished"





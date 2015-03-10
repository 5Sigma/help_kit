Feature: Category administration
  @javascript
  Scenario: admin creates a category
    Given a logged in admin user
    When admin creates a category
    Then admin should see 1 category
  @javascript
  Scenario: admin creates nested category
    Given a logged in admin user
    And a category
    When admin creates a nested category
    Then admin should see 2 categories
  Scenario: admin deletes a category
    Given a logged in admin user
    And a category
    When admin deletes a category
    Then admin should see 0 categories
  @javascript
  Scenario: admin edits a category
    Given a logged in admin user
    And a category
    When admin renames a category to "Test category"
    Then admin should see a category named "Test category"

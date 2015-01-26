Feature: Article browsing
  Scenario: view an existing article
    Given an article
    When a guest views an article
    Then a guest should see the article content



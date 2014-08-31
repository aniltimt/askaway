Feature: Site admin invites rep to party
  As a site admin
  I want to delete offensive comments
  So I don't get sued

  Scenario: Site admin deletes comment
    Given I am logged in as an admin
    And there is a question with a comment
    When I visit the question
    And I click "Delete"
    Then the comment should no longer exist

  Scenario: User cannot delete comment
    Given I am logged in
    And there is a question with a comment
    When I visit the question
    Then I should not see "Delete"


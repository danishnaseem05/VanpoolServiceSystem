Feature: Allow admin to create vanpools

  Scenario: Create Vanpools
    Given user is logged in as admin
    And I am on Vanpools welcome page
    #And I click "Create New Vanpool"
    Then I should be redirected to "/"


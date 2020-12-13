Feature: Allow people with accounts to login

Scenario: Login
  When I am on Vanpools homepage
  And I click "Sign up/Login"
  Then I should be redirected to "/login"
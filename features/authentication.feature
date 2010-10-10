Feature: Authentication
  In order to be able to assign users to teams and projects to users
  As a new visitor to the website
  I want to be able to create an account and log in and out
  
  Scenario: Create a new account
    Given I am on the registration page
    When I fill in "Email" with "neil@plasticwater.com"
    And I fill in "Business name" with "neils"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on my business page
    And there should be 1 user
    And I should not see "Sign in"

  Scenario: Logging in
    Given I have a user with the email "neil@plasticwater.com" and the business "neils"
    When I go to the login page
    And I fill in "Email" with "neil@plasticwater.com"
    And I fill in "Password" with "secret"
    And I press "Sign in"
    Then I should be on my business page
    And I should see "Welcome back"
    And I should see "Sign out"
    
  Scenario: Logging out
     Given I have a user with the email "neil@plasticwater.com" and the business "neils"
    And I am logged in as the user "neil@plasticwater.com"
    When I follow "Sign out"
    Then I should be logged out

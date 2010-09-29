Feature: Authentication
  In order to be able to assign users to teams and projects to users
  As a new visitor to the website
  I want to be able to create an account and log in and out
  
  Scenario: Create a new account
    Given I am on the registration page
    When I fill in "Email" with "neil@plasticwater.com"
    And I fill in "Domain name" with "neils"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be on the user account page for "neiled"
    And there should be 1 user

  Scenario: Logging in
    Given I have a user with the email "neil@plasticwater.com" and the password "secret"
    And I am on the login page
    When I fill in "email" with "neil@platicwater.com"
    And I fill in "password" with "secret"
    And I press "Sign in"
    Then I should be on the user account page for "neil@plasticwater.com"
    And I should see "Welcome back"
    And I should see "Sign out"
    
  Scenario: Logging out
    Given I have a user with the email "neil@plasticwater.com" and the password "secret"
    And I am logged in as the user "neil@plasticwater.com"
    And I am on the user account page for "neil@plasticwater.com"
    When I follow "Sign out"
    Then I should be logged out

Feature: Manage business settings
  In order for customers to be able to make appropriate bookings
  As the owner of the business
  I want to be able to set my business details


  Scenario: Edit the name of the business
    Given I am logged in
    And I am on the edit business page
    When I fill in "Name" with "Edited Name"
    And I press "Update"
    Then I should be on the edit business page
    And my business should be called "Edited Name"
  

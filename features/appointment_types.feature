Feature: Managing Appointment Types
  In order to make sure customers book the correct type of Appointment
  As the owner of a business
  I want to be able to add, remove, update appointment types


  Scenario: Creating a new appointment type
    Given I am logged in
    And I am on the edit business page
    When I follow "Add a new appointment type"
    And I fill in "Name" with "Cut and Colour"
    And I fill in "Price" with "10"
    And I fill in "Description" with "Make you hair a nice blue!"
    And I fill in "Duration" with "60"
    And I press "Create Appointment type"
    Then I should be on the edit business page
    And there should be 1 appointment type
    And I should see "Cut and Colour"
  

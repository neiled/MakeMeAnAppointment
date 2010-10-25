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

  Scenario: Creating a new appointment type without a name
    Given I am logged in
    And I am on the edit business page
    When I follow "Add a new appointment type"
    And I press "Create Appointment type"
    Then there should be 0 appointment types
    And I should see "can't be blank"
  
  Scenario: Editing an appointment type
    Given I am logged in
    And I have an appointment type called "Cut and Colour"
    And I am on the edit business page
    When I follow "Cut and Colour"
    And I fill in "Name" with "Shaved head"
    And I press "Update"
    Then I should be on the edit business page
    And I should see "Saved head"

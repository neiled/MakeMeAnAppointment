Feature: Managing a business calendar
  In order to be able to show customers the times they can book appointments
  As a business owner I want to be able to describe my default opening hours

  Scenario: Adding one holiday date
    Given I am logged in
    And I am on the edit business page
    When I follow "Manage Business Calendar"
    And I fill in "Start Date" with "25/12/2010"
    And I press "Update"
    Then I should be on the edit business calendar page
    And I should see "25/12/2010"
    And I should see "Date Added"
  

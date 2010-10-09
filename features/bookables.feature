Feature: Bookable items
	In order to be able to let customers book things
	As the owner of the business
	I want to be able to define the things that can be booked

	Scenario: Create a new bookable item
		Given I am logged in
		When I follow "Add something that can be booked"
		And I fill in "Name" with "Sally"
		And I fill in "Description" with "The best hairdresser in the world"
		And I press "Create Bookable"
    Then I should be on my business page
		And there should be 1 bookable item
		And I should see "Sally"

  Scenario: Edit a bookable item
    Given I am logged in
    And I have a bookable item called "Bob"
    And I am on my business page
    When I follow "Edit"
    And I fill in "Name" with "Bob2"
    And I press "Update"
    Then I should be on my business page
    And there should be 1 bookable item
    And I should see "Bob2"

Feature: Bookable items
	In order to be able to let customers book things
	As the owner of the business
	I want to be able to define the things that can be booked

	Scenario: Create a new bookable item
		Given I am I logged in
		When I follow "Add something that can be booked"
		And I fill in "Name" with "Sally"
		And I fill in "Description" with "The best hairdresser in the world"
		And I press "Add"
		Then I should be on my business page
		And there should be one bookable item
		And I should see "Sally"

Then /^there should be (\d+) user$/ do |arg1|
  User.all.count == arg1
end


Given /^I have a user with the email "([^"]*)" and the password "([^"]*)"$/ do |arg1, arg2|
  visit new_user_path
  fill_in "Email", :with => arg1
  fill_in "Password", :with =>arg2
  fill_in "Password confirmation", :with =>arg2
  fill_in "Business name", :with => "Acme Co"
  click_button "Sign up"
end

Given /^I am logged in as the user "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be logged out$/ do
  pending # express the regexp above with the code you wish you had
end


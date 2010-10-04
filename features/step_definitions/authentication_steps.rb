When /^I take a snapshot/ do
  save_and_open_page
end

Then /^there should be (\d+) user$/ do |arg1|
  User.all.count == arg1
end


Given /^I have a user with the email "([^"]*)" and the business "([^"]*)"$/ do |arg1, arg2|
  visit new_user_path
  fill_in "Email", :with => arg1
  fill_in "Password", :with =>"secret"
  fill_in "Password confirmation", :with =>"secret"
  fill_in "Business name", :with => arg2
  click_button "Sign up"
  visit signout_path
end

Given /^I am logged in as the user "([^"]*)"$/ do |arg1|
  visit new_user_session_path
  fill_in "Email", :with => arg1
  fill_in "Password", :with =>"secret"
  click_button "Sign in"
end

Then /^I should be logged out$/ do
  UserSession.find.should be_nil
end


Then /^there should be (\d+) bookable item[s]?$/ do |number|
  assert Bookable.all.count == number.to_i
end

Given /^I have a bookable item called "([^"]*)"$/ do |arg1|
  Business.first.bookables.create(:name => arg1)
end


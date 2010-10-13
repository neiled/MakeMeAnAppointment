Then /^my business should be called "([^"]*)"$/ do |arg1|
  assert_equal User.first.business.name, arg1
end

Then /^my business should have an address of "([^"]*)"$/ do |arg1|
  assert_equal User.first.business.address, arg1
end



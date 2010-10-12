Then /^my business should be called "([^"]*)"$/ do |arg1|
  assert_equal User.first.business.name, arg1
end


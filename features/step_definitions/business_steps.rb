Then /^my business should be called "([^"]*)"$/ do |arg1|
  current_user.business.name.should = arg1
end


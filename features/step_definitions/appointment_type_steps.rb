Then /^there should be (\d+) appointment type[s]?$/ do |number|
  assert AppointmentType.all.count == number.to_i
end

Given /^I have an appointment type called "([^"]*)"$/ do |arg1|
  Business.first.appointment_types.create(Factory.attributes_for(:appointment_type, :name => arg1, :business_id => Business.first.id))
end



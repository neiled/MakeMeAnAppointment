Then /^there should be (\d+) appointment type$/ do |number|
  assert AppointmentType.all.count == number.to_i
end


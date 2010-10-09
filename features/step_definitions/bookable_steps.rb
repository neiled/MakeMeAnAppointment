Then /^there should be (\d+) bookable item[s]?$/ do |number|
  assert Bookable.all.count == 1
end

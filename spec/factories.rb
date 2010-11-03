Factory.define :business do |b|
  b.name "Acme Corp"
  b.address "Buckingham Palace, London"
end

Factory.define :user do |f|
  f.email "neil@plasticwater.com"
  f.password "password"
  f.password_confirmation {|u| u.password }
  f.business {|f| f.association(:business)}
  f.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define(:bookable) do |b|
  b.name "My Bookable Thing"
  b.description "This bookable thing is bookable"
  b.business {|b| b.association(:business)}
end

Factory.define(:appointment_type) do |a|
  a.name "Cut and Colour"
  a.description "Go from brunette to blonde"
  a.business {|b| b.association(:business)}
  a.price 20
  a.duration 30
end

Factory.define(:calendar) do |c|

end

Factory.define(:holiday_date) do |d|
  d.calendar { |d| d.association(:calendar)}
  d.date nil
  d.start_time nil
  d.end_time nil
end

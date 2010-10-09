Factory.define :user do |f|
  f.email "neil@plasticwater.com"
  f.password "password"
  f.password_confirmation {|u| u.password }
end

Factory.define :business do |b|
  b.name "Acme Corp"
end

Factory.define(:bookable) do |b|
  b.name "My Bookable Thing"
  b.description "This bookable thing is bookable"
  b.business {|b| b.association(:business)}
end

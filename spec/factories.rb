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

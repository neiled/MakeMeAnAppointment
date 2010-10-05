Factory.define :user do |f|
  f.email "neil@plasticwater.com"
  f.password "password"
  f.password_confirmation {|u| u.password }
end

Factory.define :business do |b|
  b.name "Acme Corp"
end

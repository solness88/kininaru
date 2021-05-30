5.times do |n|
  User.create!(
    name: "admin_guest#{n}",
    email: "adminguest#{n}@adminguest.com",
    password: "123qwe",
    password_confirmation: "123qwe",
    admin: true
  )
end

5.times do |n|
  User.create!(
    name: "guest#{n}",
    email: "guest#{n}@guest.com",
    password: "123qwe",
    password_confirmation: "123qwe",
    admin: false
  )
end

User.create!(
  name: "admin-guest",
  email: "admin-guest@admin-guest.com",
  password: "123qwe",
  password_confirmation: "123qwe",
  admin: true
)
end

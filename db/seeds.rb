  Account.create!(name:  "Admin User",
             email: "admin@admin.com",
             password: "123321",
             password_confirmation: "123321",
             role: 1,
             active_status: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Account.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 0,
               active_status: 1)
end

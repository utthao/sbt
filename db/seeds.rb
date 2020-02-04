Account.create!(name:  "Admin User",
             email: "admin@admin.com",
             password: "123321",
             password_confirmation: "123321",
             role: 0,
             active_status: 1)

Account.create!(name:  "Normal User",
             email: "user2@user.com",
             password: "123321",
             password_confirmation: "123321",
             role: 1,
             active_status: 1)

Category.create!(name:  "Da Nang", status: 1)
Category.create!(name:  "Hue", status: 1)
Category.create!(name:  "Hoi An", status: 0)
Category.create!(name:  "Hoi An", status:0)

# 10.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   Account.create!(name:  name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                role: 1,
#                active_status: 1)
# end

# Tour.create!(account_id: 1, category_id: 1, title: "This is test tour", content: "This is test content ", price: 9999999, status: 1)
# Tour.create!(account_id: 2, category_id: 2, title: "This is test tour2", content: "This is test content2 ", price: 9999999, status: 1)
# Tour.create!(account_id: 3, category_id: 3, title: "This is test tour3", content: "This is test content3 ", price: 9999999, status: 1)
# Tour.create!(account_id: 4, category_id: 1, title: "This is test tour4", content: "This is test content4 ", price: 9999999, status: 1)
# Tour.create!(account_id: 1, category_id: 1, title: "This is test tour5", content: "This is test content ", price: 9999999, status: 1)
# Tour.create!(account_id: 2, category_id: 2, title: "This is test tour6", content: "This is test content2 ", price: 9999999, status: 1)
# Tour.create!(account_id: 3, category_id: 3, title: "This is test tour7", content: "This is test content3 ", price: 9999999, status: 1)
# Tour.create!(account_id: 4, category_id: 1, title: "This is test tour8", content: "This is test content4 ", price: 9999999, status: 1)
# Tour.create!(account_id: 1, category_id: 1, title: "This is test tour9", content: "This is test content ", price: 9999999, status: 1)
# Tour.create!(account_id: 2, category_id: 2, title: "This is test tour10", content: "This is test content2 ", price: 9999999, status: 1)
# Tour.create!(account_id: 3, category_id: 3, title: "This is test tour11", content: "This is test content3 ", price: 9999999, status: 0)
# Tour.create!(account_id: 4, category_id: 1, title: "This is test tour12", content: "This is test content4 ", price: 9999999, status: 0)

# Review.create!(account_id: 3, tour_id: 1, title: "Review title is here 1", content: "This is content")
# Review.create!(account_id: 4, tour_id: 1, title: "Review title is here 2", content: "This is content")
# Review.create!(account_id: 5, tour_id: 1, title: "Review title is here 3", content: "This is content")



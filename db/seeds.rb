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

Account.create!(name:  "Normal User",
             email: "user@user.com",
             password: "123321",
             password_confirmation: "123321",
             role: 1,
             active_status: 1)

Category.create!(name:  "Da Nang", status: 1)
Category.create!(name:  "Hue", status: 1)
Category.create!(name:  "Hoi An", status: 0)

Tour.create!(account_id: 1, category_id: 1, title: "Tour ngay 6/2 ", content: "Tour ngay 6/2 Tour ngay 6/2 Tour ngay 6/2 Tour nga...", image: nil, avg_rate: 0.0, rate_amount: 0, price: 100000, status: "visible", start_day: "2020-02-06 00:00:00", end_day: "2020-02-08 00:00:00")

Tour.create!(account_id: 1, category_id: 1, title: "tour ngay 10/2 ", content: "tour ngay 10/2 tour ngay 10/2 tour ngay 10/2 tour ...", image: nil, avg_rate: 0.0, rate_amount: 0, price: 100000, status: "visible", start_day: "2020-02-10 00:00:00", end_day: "2020-02-13 00:00:00")


Tour.create!(account_id: 1, category_id: 2, title: "tour thang 3 ", content: "tour thang 3 tour thang 3 tour thang 3 tour thang ...", image: nil, avg_rate: 0.0, rate_amount: 0, price: 200000, status: "visible", start_day: "2020-03-06 00:00:00", end_day: "2020-03-06 00:00:00")

Tour.create!(account_id: 1, category_id: 1, title: "tour 2019 ne ", content: "tour 2019 ne tour 2019 ne tour 2019 ne tour 2019 n...", image: nil, avg_rate: 0.0, rate_amount: 0, price: 20000, status: "visible", start_day: "2019-02-06 00:00:00", end_day: "2019-02-06 00:00:00")

Tour.create!( account_id: 1, category_id: 1, title: "tour thang 1 ", content: "tour thang 1 tour thang 1 tour thang 1 tour thang ...", image: nil, avg_rate: 0.0, rate_amount: 0, price: 100000, status: "visible", start_day: "2020-01-06 00:00:00", end_day: "2020-01-06 00:00:00")


Image.create!(tour_id: 1, path: "illustration-geiranger.jpg")
Image.create!(tour_id: 1, path: "pexels-photo-414612.jpeg")
Image.create!(tour_id: 2, path: "da-lat-mua-co-hong-2.jpg")
Image.create!(tour_id: 2, path: "dl.jpeg")
Image.create!(tour_id: 2, path: "da-lat-mua-co-hong-2.jpeg")
Image.create!(tour_id: 2, path: "dl2.jpeg")
Image.create!(tour_id: 2, path: "dl2.jpeg")
Image.create!(tour_id: 4, path: "da-lat-mua-co-hong-2.jpeg")
Image.create!(tour_id: 3, path: "dl2.jpeg")
Image.create!(tour_id: 3, path: "da-lat-mua-co-hong-2.jpeg")
Image.create!(tour_id: 5, path: "dl2.jpeg")
Image.create!(tour_id: 5, path: "da-lat-mua-co-hong-2.jpeg")
Image.create!(tour_id: 4, path: "da-lat-mua-co-hong-2.jpeg")
Image.create!(tour_id: 4, path: "dl2.jpeg")
Image.create!(tour_id: 5, path: "dl2.jpeg")

Booking.create!(account_id: 3, tour_id: 1, amount: 5, total_price: nil, status: "accepted", rated: nil)
Booking.create!(account_id: 3, tour_id: 4, amount: 7, total_price: nil, status: "denied", rated: nil)
Booking.create!(account_id: 3, tour_id: 2, amount: 7, total_price: nil, status: "accepted", rated: nil)
Booking.create!(account_id: 3, tour_id: 3, amount: 9, total_price: nil, status: "uncheck", rated: nil)



User.create!(name: "Administrador",
              login: "admin",
              email: "admin@localhost",
              password: "120988",
              password_confirmation: "120988")
# 50.times do |n|
#   name = Faker::Name.name
#   login = Faker::Internet.unique.email
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                 login: login,
#                 email: email,
#                 password: password,
#                 password_confirmation: password)
# end
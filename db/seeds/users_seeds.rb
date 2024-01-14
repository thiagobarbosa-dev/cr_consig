User.create!(name: "Administrador",
              login: "admin",
              email: "admin@localhost",
              password: "123321",
              password_confirmation: "123321")
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
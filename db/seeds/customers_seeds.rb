200.times do |n|
  company_name = Faker::Company.name
  trading_name = Faker::Company.name
  ein_number = Faker::Company.brazilian_company_number
  main_email = Faker::Internet.email
  whatsapp_number = Faker::PhoneNumber.cell_phone
  user_id = User.first.id
  Customer.create!(company_name: company_name,
                    trading_name: trading_name,
                    ein_number: ein_number,
                    main_email: main_email,
                    whatsapp_number: whatsapp_number,
                    user_id: user_id,
                    last_update_by_user_id: user_id)
end

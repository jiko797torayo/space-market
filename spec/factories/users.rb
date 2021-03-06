FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    icon                  { File.open("#{Rails.root}/public/images/notrobot.png") }
    password              { password }
    password_confirmation { password }
    accepted              { "1" }
  end
end

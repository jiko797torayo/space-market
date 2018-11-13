FactoryBot.define do
  factory :equipment_info do
    postal_code    { Faker::Address.postcode.delete("-") }
    prefecture     { Faker::Address.state }
    city_name      { Faker::Address.city }
    street_name    { Faker::Address.street_name }
    building_name  { Faker::Address.building_number }
    latitude       { Faker::Address.latitude }
    longitude      { Faker::Address.longitude }
    access         { Faker::Lorem.sentences }
    phone_number   { Faker::PhoneNumber.phone_number.delete("-") }
    equipment_type { EquipmentInfo.equipment_types.keys.sample }
    space_id       { Faker::Number.between(1, 999) }
  end
end

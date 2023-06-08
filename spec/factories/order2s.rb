FactoryBot.define do
  factory :order2 do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4560' }
    place_id { 1 }
    city {"横浜市緑区"}
    banti { Faker::Address.street_address}
    building_name {Faker::Address.street_address }
    tel { Faker::Number.decimal_part(digits: 11) }
     token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end

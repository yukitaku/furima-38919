FactoryBot.define do
  factory :item do

    item_name {Faker::Lorem.sentence}
    catch_copy {Faker::Lorem.sentence}
    category_id{2}
    condition_id{2}
    period_id{2}
    place_id{2}
    okuru_id{2}
    price{350}

    association :user   
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('spec/test_image.png'), filename: 'test_image.png')
    end
  end
end

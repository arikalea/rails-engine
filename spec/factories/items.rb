FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { |d| "Description for: #{d}" }
    unit_price { 2.5 }
    merchant
  end
end

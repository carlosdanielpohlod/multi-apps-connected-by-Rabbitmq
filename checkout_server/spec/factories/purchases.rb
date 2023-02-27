FactoryBot.define do
  factory :purchase do
    status { 'pending' }
    external_user_id { rand }
    product
  end
end

FactoryBot.define do
  factory :purchase do
    completed { false }
    user
    product
  end
end

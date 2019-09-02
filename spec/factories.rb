FactoryBot.define do
  factory :category do
    sequence(:name) { |i| "My category #{i}" }
  end

  factory :article do
    title { "Some name" }
    content { "Some content" }
    category
  end
end

FactoryBot.define do
  factory :article do
    title {'tokyo'}
    link {'aaaaaa'}
    image {''}
    association :user
  end
end

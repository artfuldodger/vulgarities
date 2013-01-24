FactoryGirl.define do
  factory :vulgarity do
    sequence(:text) { |n| "something obscene #{n}" }
  end
end

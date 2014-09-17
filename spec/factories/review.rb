FactoryGirl.define do
  factory :review do
    user
    book
    text   'It was okay'
    rating { rand(5) + 1 }
  end
end

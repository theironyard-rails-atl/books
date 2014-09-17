FactoryGirl.define do
  factory :book_shelf do
    user
    sequence(:name) { |n| "Bookshelf #{n}" }
  end
end

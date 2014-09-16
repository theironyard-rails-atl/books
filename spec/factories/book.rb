FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Harry Potter #{n}" }
    author           'J.K. Rowling'
    sequence(:isbn)  { |n| "#{n}-0439708184" }
    description      '-'
    image_url        'http://upload.wikimedia.org/wikipedia/en/b/bf/Harry_Potter_and_the_Sorcerer\'s_Stone.jpg'
    created_by       { create(:user).id }
  end
end

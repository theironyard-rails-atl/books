FactoryGirl.define do
  factory :recommendation do
    sender { create :user }
    book
    text 'Worth a read'
    recipient do
      create(:user).tap { |r| r.friend! self. sender }
    end
  end
end

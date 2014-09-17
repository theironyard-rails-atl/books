desc 'Mock out some sample data'
task :mock do
  require 'factory_girl_rails'

  books = 10.times.map { FactoryGirl.create :book }

  3.times { FactoryGirl.create :user }
  users = User.all

  # Friends
  users.combination(2).each do |a,b|
    a.friend!(b) unless rand(3).zero?
  end

  # Reivews
  books.each do |book|
    reviewers = users.sample(rand 3)
    reviewers.each do |reviewer|
      FactoryGirl.create :review, book: book, user: reviewer
    end
  end
end

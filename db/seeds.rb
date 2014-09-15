# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_book(user, isbn)
  b = user.created_books.new(isbn: isbn)
  b.book_data_lookup
  b.save!
end


u = User.create!(email: "example1@mailinator.com", password: "password")
["0545010225", "0982986270", "1594633118"].each do |isbn|
  create_book(u, isbn)
end

u = User.create!(email: "example2@mailinator.com", password: "password")
["0061122416", "014241543X", "1594206147"].each do |isbn|
  create_book(u, isbn)
end




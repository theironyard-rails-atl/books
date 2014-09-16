json.array! @reviews do |r|
  json.(r, :user, :book, :text, :rating, :created_at)
end

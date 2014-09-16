json.array! @recommendations do |r|
  json.(r, :sender, :recipient, :book, :text, :created_at, :updated_at)
end

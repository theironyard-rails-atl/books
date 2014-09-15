json.books @books do |book|
  json.(book, :id, :title, :author, :isbn, :image_url, :description, :created_at, :updated_at, :created_by)
end
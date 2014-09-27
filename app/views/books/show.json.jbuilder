json.(@book, :id, :title, :author, :isbn, :image_url, :description, :created_at, :updated_at, :creator)

#names = []
#@book.categories.each { |category| names << category.name }
# Doesn't work, want pluck @book.categories[:name]

json.categories @book.categories.pluck(:name).join(", ")

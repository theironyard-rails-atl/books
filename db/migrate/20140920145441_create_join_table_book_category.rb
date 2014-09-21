class CreateJoinTableBookCategory < ActiveRecord::Migration
  def create
    create_table :books_categories, :id => false do |t|
      t.index :book_id
      t.index :category_id
      # t.index [:category_id, :book_id]
    end
  end
end

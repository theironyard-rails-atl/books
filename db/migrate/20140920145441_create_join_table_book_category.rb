class CreateJoinTableBookCategory < ActiveRecord::Migration
  def change
    create_join_table :books, :categories do |t|
      # t.integer :book_id
      # t.integer :category_id
      t.index :book_id
      t.index :category_id
      # t.index [:category_id, :book_id]
    end
  end
end

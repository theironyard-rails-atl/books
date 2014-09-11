class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :book_id
      t.text :text

      t.timestamps
    end
  end
end

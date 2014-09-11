class AddCreatedByToBooks < ActiveRecord::Migration
  def change
    add_column :books, :created_by, :integer
  end
end

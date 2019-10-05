class AddPermalinkToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :permalink, :string
    add_index :categories, :permalink
  end
end

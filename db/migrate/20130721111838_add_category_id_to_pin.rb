class AddCategoryIdToPin < ActiveRecord::Migration
  def change
    add_column :pins, :category_id, :integer
  end
end

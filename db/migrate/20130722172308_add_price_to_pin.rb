class AddPriceToPin < ActiveRecord::Migration
  def change
    add_column :pins, :price, :decimal, :precision => 8, :scale => 2
  end
end

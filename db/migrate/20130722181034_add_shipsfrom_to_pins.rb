class AddShipsfromToPins < ActiveRecord::Migration
  def change
    add_column :pins, :shipsfrom, :string
  end
end

class AddPinnameToPins < ActiveRecord::Migration
  def change
    add_column :pins, :pinname, :string
  end
end

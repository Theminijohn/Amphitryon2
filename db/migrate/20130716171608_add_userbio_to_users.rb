class AddUserbioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userbio, :string
  end
end

class AddTumblrlinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tumblrlink, :string
  end
end

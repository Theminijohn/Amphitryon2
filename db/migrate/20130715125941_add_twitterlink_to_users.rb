class AddTwitterlinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitterlink, :string
  end
end

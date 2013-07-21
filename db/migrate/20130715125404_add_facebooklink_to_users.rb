class AddFacebooklinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebooklink, :string
  end
end

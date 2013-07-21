class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :pins
end

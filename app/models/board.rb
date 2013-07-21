class Board < ActiveRecord::Base
  attr_accessible :description, :name

	validates :name, presence: true, length: { :minimum => 3, :maximum => 20 }

	#A board contains many Pins
	has_many :pins
	belongs_to :user

end

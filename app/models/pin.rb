class Pin < ActiveRecord::Base
  attr_accessible :description, :image, :image_remote_url, :pinname, :category_id,
									:price, :shipsfrom

	#Validating Pin Name
	validates :pinname, presence: true, length: { :minimum => 5, :maximum => 35}

  #Pin Description Validation
	validates :description, presence: true, length: { :minimum => 5}

  #Checks if user_id is present for uploading a a pin
  validates :user_id, presence: true

  validates :category, presence: true

  #Pins belongs to ONE user
	belongs_to :user

	#Pin belongs to ONE Board
	belongs_to :board

  #Pin belongs to ONE Category
  belongs_to :category

  #For paperclip
  has_attached_file :image, styles: { medium: "320x240>" }
  #Validates the Image Attachment
	validates_attachment :image, presence: true,
                       content_type: { content_type: [ 'image/jpeg', 'image/jpg', 'image/png', 'image/gif' ] },
                       size: { less_than: 5.megabytes }

  #For Remote URL Image Upload
  def image_remote_url=(url_value)
	  self.image = URI.parse(url_value) unless url_value.blank?
	  super
  end

end

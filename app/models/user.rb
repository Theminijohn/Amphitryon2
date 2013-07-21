class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, #:recoverable,
	       :rememberable, :trackable, :validatable,
	       :omniauthable, :omniauth_providers => [:facebook]

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
	                :provider, :uid, :country, :facebooklink, :twitterlink, :tumblrlink,
									:avatar, :avatar_file_name, :userbio


	#Validates User Bio
	#validates :userbio, length: { :minimum => 0, :maximum => 140 }

	#For Profile Picture
	has_attached_file :avatar, :default_url => "http://placehold.it/150x150&text=Missing",
										:styles => { :thumb => "48x48>",
																					 :avatar => "154x154>",
																					 :medium => "300x300>"}

	#Validates the Profile Picture
	validates_attachment :avatar,
											 content_type: { content_type: [ 'image/jpeg', 'image/jpg', 'image/png'] },
											 size: { less_than: 4.megabytes }

	# attr_accessible :title, :body

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		unless user
			user = User.create(name:auth.extra.raw_info.name,
			                   provider:auth.provider,
			                   uid:auth.uid,
			                   email:auth.info.email,
			                   password:Devise.friendly_token[0,20]
			)
		end
		user
	end

	has_many :pins
	has_many :boards
end

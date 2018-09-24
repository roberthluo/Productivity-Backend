class User < ApplicationRecord
	before_save :format_user_attr
	validates :name, :email, presence: true, length: {maximum: 255}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	
	has_one :profile, dependent: :destroy

	def format_user_attr
		self.email.downcase!
	end 
end

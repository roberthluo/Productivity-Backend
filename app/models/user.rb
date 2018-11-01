class User < ApplicationRecord
	before_save :format_user_attr
	validates :name, :email, presence: true, length: {maximum: 255}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	

	devise  :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable,
	:confirmable, :lockable, :timeoutable,
	:omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]


	def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
	end
	
	def format_user_attr
		self.email.downcase!
	end 
end

class User < ApplicationRecord
	has_secure_password
	validates :username, presence: true, length: {minimum: 5}, uniqueness: true
	validates :password, length: { in: 6..20 }
	validates_email_format_of :email, :message => 'must be a valid email'
	validates :email, uniqueness: true

	has_many :posts
	has_many :topics

end

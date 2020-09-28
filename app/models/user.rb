class User < ApplicationRecord
	has_secure_password
	validates :username, uniqueness: { case_sensitive: false }

	has_many :favorites
	has_many :movies, through: :favorites

	has_many :watcheds
	has_many :movies, through: :watcheds
end

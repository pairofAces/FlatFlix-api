class Movie < ApplicationRecord
	has_many :favorites
	has_many :watcheds
end

class Movie < ApplicationRecord
	belongs_to :favorite
	belongs_to :watched
end

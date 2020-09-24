class Movie < ApplicationRecord
	belongs_to :favorite, optional: true
	belongs_to :watched, optional: true
end

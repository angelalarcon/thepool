class Country < ActiveRecord::Base
	has_many :developers
	has_many :sponsors
end

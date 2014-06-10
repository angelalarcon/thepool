class Sponsor < ActiveRecord::Base
	attr_accessible :name, :last_name, :email, :phone, :company_name, :company_email, :company_phone, :country_id
	has_one :user, :as => :profileable
	has_many :developers
	accepts_nested_attributes_for :user
	belongs_to :country

	validates :name, 
		presence: true,
		length: { minimum: 3 }

	validates :company_email, 
		uniqueness: true,
		length: { minimum: 10 },
		email: true

	# ACCIONES
	def full_name
        [first_name, last_name].join(' ')
    end

    def full_name_reverse
        [last_name, first_name].join(', ')
    end
end

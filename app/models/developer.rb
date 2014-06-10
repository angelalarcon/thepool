class Developer < ActiveRecord::Base
	attr_accessible :name, :last_name, :email, :phone, :address, :why_hack, :scholarship, :why_scholarship, :country_id
	has_one :user, :as => :profileable
	has_and_belongs_to_many :behaviors
	belongs_to :sponsor
	accepts_nested_attributes_for :user
	belongs_to :country

	validates :sponsor_id, 
		presence: false, 
		allow_blank: true

	validates :why_hack, 
		length: { minimum: 10 }, 
		on: :create

	validates :why_scholarship, 
		length: { minimum: 10 }, 
		presence: true, 
		if: "scholarship?"

	def full_name
        [first_name, last_name].join(' ')
    end

    def full_name_reverse
        [last_name, first_name].join(', ')
    end
end

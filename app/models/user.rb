class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :profileable, :polymorphic => true
	attr_accessible :email, :password, :password_confirmation, :remember_me, :profileable_id, :profileable_type
	accepts_nested_attributes_for :profileable
end

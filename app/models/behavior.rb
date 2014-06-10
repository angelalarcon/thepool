class Behavior < ActiveRecord::Base
  #icon_type:
    #1: ICONO
    #2: IMAGEN
  attr_accessible :name, :icon_url, :icon_code, :icon_type
  has_and_belongs_to_many :developers
end

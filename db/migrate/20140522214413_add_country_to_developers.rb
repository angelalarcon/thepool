class AddCountryToDevelopers < ActiveRecord::Migration
  def change
    add_reference :developers, :country, index: true
  end
end

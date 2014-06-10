class AddCountryToSponsors < ActiveRecord::Migration
  def change
    add_reference :sponsors, :country, index: true
  end
end

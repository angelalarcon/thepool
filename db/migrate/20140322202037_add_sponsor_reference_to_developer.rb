class AddSponsorReferenceToDeveloper < ActiveRecord::Migration
  def change
  	change_table :developers do |t|
    	t.references :sponsor, index: true, null: true, defautl: nil
    end
  end
end

class CreateDevelopersPromos < ActiveRecord::Migration
  def change
    create_table :developers_promos, :id => false do |t|
      t.references :developer, index: true
      t.references :promo, index: true
    end
    #add_index :developers_promos, [:developer, :promo], :unique => true
  end
end

class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.integer :lapse
      t.integer :year

      t.timestamps
    end
  end
end

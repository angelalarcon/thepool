class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :iso, :size => 2
      t.string :name, :size => 80
      t.timestamps
    end
  end
end

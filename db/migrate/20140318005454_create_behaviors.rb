class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.string :name
      t.string :icon_url
      t.string :icon_code
      t.integer :icon_type

      t.timestamps
    end
  end
end

class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.text :why_hack
      t.boolean :scholarship
      t.text :why_scholarship

      t.timestamps
    end
  end
end

class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company_name
      t.string :company_email
      t.string :company_phone
      t.boolean :active

      t.timestamps
    end
  end
end

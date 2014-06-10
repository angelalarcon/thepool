class CreateBehaviorsDevelopers < ActiveRecord::Migration
  def change
    create_table :behaviors_developers do |t|
    	t.belongs_to :behaviors
    	t.belongs_to :developers
    end
  end
end

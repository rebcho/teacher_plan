class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :plan_id
      t.text :description

      t.timestamps

    end
  end
end

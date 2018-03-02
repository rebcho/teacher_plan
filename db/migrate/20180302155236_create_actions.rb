class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :goal_id
      t.string :description
      t.date :target_date
      t.text :lead_person
      t.text :resources_needed
      t.text :imp_specifics
      t.text :success_measurement

      t.timestamps

    end
  end
end

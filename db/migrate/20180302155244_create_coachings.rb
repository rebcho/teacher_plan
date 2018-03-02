class CreateCoachings < ActiveRecord::Migration
  def change
    create_table :coachings do |t|
      t.integer :plan_id
      t.integer :user_id

      t.timestamps

    end
  end
end

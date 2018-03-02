class CreateImprovementPlans < ActiveRecord::Migration
  def change
    create_table :improvement_plans do |t|
      t.integer :status_id
      t.integer :user_id
      t.string :title

      t.timestamps

    end
  end
end

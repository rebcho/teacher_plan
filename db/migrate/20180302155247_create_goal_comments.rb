class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :goal_id

      t.timestamps

    end
  end
end

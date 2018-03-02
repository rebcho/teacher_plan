class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :class_name => "PlanComment",
             :foreign_key => "plan_id",
             :dependent => :destroy

  has_many   :goals,
             :foreign_key => "plan_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  validates :status_id, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

end

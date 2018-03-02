class ImprovementPlan < ApplicationRecord
  # Direct associations

  belongs_to :status

  has_many   :coachings,
             :foreign_key => "plan_id",
             :dependent => :destroy

  has_many   :comments,
             :class_name => "PlanComment",
             :foreign_key => "plan_id",
             :dependent => :destroy

  has_many   :goals,
             :foreign_key => "plan_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :coaches,
             :through => :coachings,
             :source => :user

  # Validations

  validates :status_id, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

end

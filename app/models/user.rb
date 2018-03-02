class User < ApplicationRecord
  # Direct associations

  has_many   :goal_comments,
             :dependent => :destroy

  has_many   :coachings,
             :dependent => :destroy

  has_many   :improvement_plans,
             :dependent => :destroy

  has_many   :comments,
             :class_name => "PlanComment",
             :dependent => :destroy

  # Indirect associations

  has_many   :coaches,
             :through => :improvement_plans,
             :source => :coaches

  has_many   :trainees,
             :through => :trainee_improvement_plans,
             :source => :user

  has_many   :trainee_improvement_plans,
             :through => :coachings,
             :source => :plan

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

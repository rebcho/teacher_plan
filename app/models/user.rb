class User < ApplicationRecord
  # Direct associations

  has_many   :coachings,
             :dependent => :destroy

  has_many   :improvement_plans,
             :dependent => :destroy

  has_many   :comments,
             :class_name => "PlanComment",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

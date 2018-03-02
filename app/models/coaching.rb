class Coaching < ApplicationRecord
  # Direct associations

  belongs_to :plan,
             :class_name => "ImprovementPlan"

  belongs_to :user

  # Indirect associations

  # Validations

end

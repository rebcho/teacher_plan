class Goal < ApplicationRecord
  # Direct associations

  has_many   :actions,
             :dependent => :destroy

  belongs_to :plan,
             :class_name => "ImprovementPlan"

  # Indirect associations

  # Validations

  validates :description, :presence => true

end

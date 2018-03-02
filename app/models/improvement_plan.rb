class ImprovementPlan < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :status_id, :presence => true

  validates :title, :presence => true

  validates :user_id, :presence => true

end

class Status < ApplicationRecord
  # Direct associations

  has_many   :improvement_plans,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end

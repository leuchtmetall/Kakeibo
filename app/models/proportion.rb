class Proportion < ApplicationRecord
  belongs_to :category, inverse_of: :proportions
  belongs_to :user

  VALUE_REGEX = "[0-9]+%?"
  validates :value, format: { with: /#{VALUE_REGEX}/ }
end

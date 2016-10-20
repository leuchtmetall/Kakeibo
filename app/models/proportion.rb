class Proportion < ApplicationRecord
  belongs_to :category, inverse_of: :proportions
  belongs_to :user
end

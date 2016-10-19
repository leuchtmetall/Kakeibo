class Category < ApplicationRecord
  belongs_to :account
  has_many :items
  has_many :proportions
end

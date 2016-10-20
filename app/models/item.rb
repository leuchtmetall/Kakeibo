class Item < ApplicationRecord
  belongs_to :entry, inverse_of: :items
  belongs_to :category
end

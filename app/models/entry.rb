class Entry < ApplicationRecord
  has_many :items
  has_many :amounts
end

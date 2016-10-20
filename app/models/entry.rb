class Entry < ApplicationRecord
  belongs_to :account
  has_many :items
  has_many :amounts

  scope :of_month, ->(year, month) { where("month = ?", year.to_i * 12 + month.to_i)}
end

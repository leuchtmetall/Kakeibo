class Account < ApplicationRecord
  has_many :account_members
  has_many :users, through: :account_members
  has_many :actegories
end

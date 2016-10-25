class Account < ApplicationRecord
  has_many :account_members
  has_many :users, through: :account_members
  has_many :categories, dependent: :destroy
  has_many :entries

  default_scope { includes(:users) }
end

class Category < ApplicationRecord
  belongs_to :account
  has_many :items
  has_many :proportions, inverse_of: :category

  validates :name, presence: true

  default_scope { includes(:proportions) }
  accepts_nested_attributes_for :proportions

  after_initialize do |category|
    # initialize proportions for all users of associated account
    proportions = category.proportions
    users_without_db_entry = category.account.users - proportions.map(&:user)
    users_without_db_entry.each do |user|
      category.proportions.new(user: user, value: 0)
    end
  end

end

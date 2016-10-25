class Category < ApplicationRecord
  belongs_to :account
  has_many :items
  has_many :proportions, inverse_of: :category, dependent: :destroy

  validates :name, presence: true

  default_scope { includes(:proportions) }
  accepts_nested_attributes_for :proportions

  def init_proportions
    # initialize proportions for all users of associated account
    proportions = self.proportions
    users_without_db_entry = self.account.users - proportions.map(&:user)
    users_without_db_entry.each do |user|
      self.proportions.new(user: user, value: 0)
    end
  end

  def proportions_json
    self.proportions.map {|a|
      [a.user_id, a.value]
    }.to_h.to_json
  end
end

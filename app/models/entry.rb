class Entry < ApplicationRecord
  belongs_to :account
  has_many :items, inverse_of: :entry, dependent: :destroy
  has_many :amounts, inverse_of: :entry, dependent: :destroy

  accepts_nested_attributes_for :amounts
  accepts_nested_attributes_for :items

  default_scope { includes([:items, :amounts]).order('time') }
  scope :of_month, ->(year, month) { where("month = ?", year.to_i * 12 + month.to_i)}

  validates :place, presence: true

  after_initialize do |entry|
    # initialize amounts for all users of associated account
    users_without_db_entry = entry.account.users - entry.amounts.map(&:user)
    users_without_db_entry.each do |user|
      entry.amounts.new(user: user, cost: 0, paid: 0)
    end

    # initialize items for all categories of associated account
    categories_without_db_entry = entry.account.categories - entry.items.map(&:category)
    categories_without_db_entry.each do |category|
      entry.items.new(category: category, amount: 0)
    end
  end

  def real_year
    month / 12
  end

  def real_month
    month % 12
  end

  def item_for_category(category_id)
    @category_hash ||= items.map {|i| [i.category_id, i] }.to_h
    @category_hash[category_id] || Item.new
  end

  def amount_for_user(user_id)
    @amount_hash ||= amounts.map {|a| [a.user_id, a] }.to_h
    @amount_hash[user_id] || Amount.new
  end

end

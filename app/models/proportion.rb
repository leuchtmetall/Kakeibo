class Proportion < ApplicationRecord
  belongs_to :category, inverse_of: :proportions
  belongs_to :user

  VALUE_REGEX = "[0-9]+%?"
  validates :value, format: { with: /#{VALUE_REGEX}/ }

  validate :user_must_be_part_of_associated_account
  def user_must_be_part_of_associated_account
    unless self.category.account.users.include?(self.user)
      errors.add(:user_id, "is not part of account")
    end
  end
end

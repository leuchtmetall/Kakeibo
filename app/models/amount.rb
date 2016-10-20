class Amount < ApplicationRecord
  belongs_to :user
  belongs_to :entry, inverse_of: :amounts

  validate :user_must_be_part_of_associated_account
  def user_must_be_part_of_associated_account
    unless self.entry.account.users.include?(self.user)
      errors.add(:user_id, "is not part of account")
    end
  end
end

class User < ApplicationRecord
  has_many :account_members
  has_many :accounts, through: :account_members
  has_many :proportions
  has_many :amounts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :short_name, length: {is: 1}

  def admin?
    self.role == 'admin'
  end
end

require 'rails_helper'

RSpec.describe AccountMember, type: :model do
  before(:context) do
    @user = build(:user)
    @account = build(:account)
  end
  subject { AccountMember.new(user: @user, account: @account) }
  it { is_expected.to be_valid }

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an account" do
    subject.account = nil
    expect(subject).to_not be_valid
  end
end

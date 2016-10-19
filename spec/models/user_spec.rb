require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    build(:user)
  }

  it { is_expected.to be_valid }
  it { is_expected.to_not be_admin }

  it "is not valid without a name" do
    subject.name = ""
    expect(subject).to_not be_valid
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without short name that is exactly one character long" do
    subject.short_name = ""
    expect(subject).to_not be_valid
    subject.short_name = nil
    expect(subject).to_not be_valid
    subject.short_name = "AB"
    expect(subject).to_not be_valid
  end

  it "is either admin or not" do
    expect(subject.admin?).to be false
    subject.role = "admin"
    expect(subject.admin?).to be true
    subject.role = "admi"
    expect(subject.admin?).to be false
    subject.role = "administrator"
    expect(subject.admin?).to be false
  end

  it "can have accounts associated to it" do
    expect(subject.accounts).to be_empty
    subject.accounts << Account.new(name: 'Test')
    expect(subject.accounts).to_not be_empty
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: 'User', short_name: 'U', email: 'text@example.com',
      password: 'test123', password_confirmation: 'test123', role: 'user')
  }

  it "is valid" do
    expect(subject).to be_valid
  end

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
end

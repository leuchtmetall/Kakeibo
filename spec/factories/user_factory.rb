FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    name 'Test User'
    short_name 'T'
    password 'test123'
    password_confirmation 'test123'
  end

  factory :admin, parent: :user do
    role 'admin'
  end
end

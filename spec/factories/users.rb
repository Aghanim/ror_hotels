FactoryGirl.define do
  factory :user do
    sequence(:email){ |i| "email#{i}@email.com"}
    password "password"
    password_confirmation "password"
  end

  factory :admin, class: User do
    sequence(:email){ |i| "email#{i}@email.com"}
    password "password"
    password_confirmation "password"
    role 1
  end
end
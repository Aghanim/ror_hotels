FactoryGirl.define do
  factory :hotel do
    title "Hotel name"
    price  100
    star_rating 5
    breakfast_in 1
    country "Russia"
    state "Some state"
    city  "Some town"
    street "Some street"
  end
end

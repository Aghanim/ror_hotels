FactoryGirl.define do
	factory :vote1, class: Vote do
       mark 5
       user_id 1
    end

    factory :vote2, class: Vote do
       mark 5
       user_id 2
    end

    factory :vote3, class: Vote do
       mark 5
       user_id 3
    end


    factory :vote21, class: Vote do
       mark 3
       user_id 1
    end

    factory :vote22, class: Vote do
       mark 2
       user_id 2
    end

    factory :vote23, class: Vote do
       mark 5
       user_id 3
    end

end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :occurrence do
    started_at "2014-06-05 13:20:49"
    expired_at "2014-06-05 13:20:49"
    generated false
    canceled_at "2014-06-05 13:20:49"
    event nil
  end
end

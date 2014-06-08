# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    addmission_charge "9.99"
    started_at "2014-06-05 12:31:19"
    expired_at "2014-06-05 12:31:19"
    schedule "MyText"
    venue nil
    aasm_state "MyString"
  end
end

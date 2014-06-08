# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name "MyString"
    phone "MyString"
    email "MyString"
    contact_name "MyString"
    description "MyText"
    aasm_state "MyString"
  end
end

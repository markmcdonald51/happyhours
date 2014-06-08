# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :escrow do
    user nil
    description "MyText"
    btc_amount "9.99"
    buyer_email "MyString"
    seller_email "MyString"
    btc_escrow_fee "9.99"
    btc_seller_fee "9.99"
    btc_buyer_fee "9.99"
    tracking_number "MyString"
    btc_amount_seller_will_receive "9.99"
    max_shipping_days 1
    inspection_days 1
    payee_invitation "MyString"
    payer_invitation "MyString"
    btc_address "MyString"
    payment_invitation "MyString"
    payment_confirmation "MyString"
    private_WIF_key "MyString"
    aasm_state "MyString"
  end
end

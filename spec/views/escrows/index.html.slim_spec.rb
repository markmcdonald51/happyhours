require 'spec_helper'

describe "escrows/index" do
  before(:each) do
    assign(:escrows, [
      stub_model(Escrow,
        :user => nil,
        :description => "MyText",
        :btc_amount => "9.99",
        :buyer_email => "Buyer Email",
        :seller_email => "Seller Email",
        :btc_escrow_fee => "9.99",
        :btc_seller_fee => "9.99",
        :btc_buyer_fee => "9.99",
        :tracking_number => "Tracking Number",
        :btc_amount_seller_will_receive => "9.99",
        :max_shipping_days => 1,
        :inspection_days => 2,
        :payee_invitation => "Payee Invitation",
        :payer_invitation => "Payer Invitation",
        :btc_address => "Btc Address",
        :payment_invitation => "Payment Invitation",
        :payment_confirmation => "Payment Confirmation",
        :private_WIF_key => "Private Wif Key",
        :aasm_state => "Aasm State"
      ),
      stub_model(Escrow,
        :user => nil,
        :description => "MyText",
        :btc_amount => "9.99",
        :buyer_email => "Buyer Email",
        :seller_email => "Seller Email",
        :btc_escrow_fee => "9.99",
        :btc_seller_fee => "9.99",
        :btc_buyer_fee => "9.99",
        :tracking_number => "Tracking Number",
        :btc_amount_seller_will_receive => "9.99",
        :max_shipping_days => 1,
        :inspection_days => 2,
        :payee_invitation => "Payee Invitation",
        :payer_invitation => "Payer Invitation",
        :btc_address => "Btc Address",
        :payment_invitation => "Payment Invitation",
        :payment_confirmation => "Payment Confirmation",
        :private_WIF_key => "Private Wif Key",
        :aasm_state => "Aasm State"
      )
    ])
  end

  it "renders a list of escrows" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Buyer Email".to_s, :count => 2
    assert_select "tr>td", :text => "Seller Email".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Tracking Number".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Payee Invitation".to_s, :count => 2
    assert_select "tr>td", :text => "Payer Invitation".to_s, :count => 2
    assert_select "tr>td", :text => "Btc Address".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Invitation".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => "Private Wif Key".to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
  end
end

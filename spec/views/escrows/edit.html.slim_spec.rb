require 'spec_helper'

describe "escrows/edit" do
  before(:each) do
    @escrow = assign(:escrow, stub_model(Escrow,
      :user => nil,
      :description => "MyText",
      :btc_amount => "9.99",
      :buyer_email => "MyString",
      :seller_email => "MyString",
      :btc_escrow_fee => "9.99",
      :btc_seller_fee => "9.99",
      :btc_buyer_fee => "9.99",
      :tracking_number => "MyString",
      :btc_amount_seller_will_receive => "9.99",
      :max_shipping_days => 1,
      :inspection_days => 1,
      :payee_invitation => "MyString",
      :payer_invitation => "MyString",
      :btc_address => "MyString",
      :payment_invitation => "MyString",
      :payment_confirmation => "MyString",
      :private_WIF_key => "MyString",
      :aasm_state => "MyString"
    ))
  end

  it "renders the edit escrow form" do
    render

    assert_select "form[action=?][method=?]", escrow_path(@escrow), "post" do
      assert_select "input#escrow_user[name=?]", "escrow[user]"
      assert_select "textarea#escrow_description[name=?]", "escrow[description]"
      assert_select "input#escrow_btc_amount[name=?]", "escrow[btc_amount]"
      assert_select "input#escrow_buyer_email[name=?]", "escrow[buyer_email]"
      assert_select "input#escrow_seller_email[name=?]", "escrow[seller_email]"
      assert_select "input#escrow_btc_escrow_fee[name=?]", "escrow[btc_escrow_fee]"
      assert_select "input#escrow_btc_seller_fee[name=?]", "escrow[btc_seller_fee]"
      assert_select "input#escrow_btc_buyer_fee[name=?]", "escrow[btc_buyer_fee]"
      assert_select "input#escrow_tracking_number[name=?]", "escrow[tracking_number]"
      assert_select "input#escrow_btc_amount_seller_will_receive[name=?]", "escrow[btc_amount_seller_will_receive]"
      assert_select "input#escrow_max_shipping_days[name=?]", "escrow[max_shipping_days]"
      assert_select "input#escrow_inspection_days[name=?]", "escrow[inspection_days]"
      assert_select "input#escrow_payee_invitation[name=?]", "escrow[payee_invitation]"
      assert_select "input#escrow_payer_invitation[name=?]", "escrow[payer_invitation]"
      assert_select "input#escrow_btc_address[name=?]", "escrow[btc_address]"
      assert_select "input#escrow_payment_invitation[name=?]", "escrow[payment_invitation]"
      assert_select "input#escrow_payment_confirmation[name=?]", "escrow[payment_confirmation]"
      assert_select "input#escrow_private_WIF_key[name=?]", "escrow[private_WIF_key]"
      assert_select "input#escrow_aasm_state[name=?]", "escrow[aasm_state]"
    end
  end
end

require 'spec_helper'

describe "escrows/show" do
  before(:each) do
    @escrow = assign(:escrow, stub_model(Escrow,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Buyer Email/)
    expect(rendered).to match(/Seller Email/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Tracking Number/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Payee Invitation/)
    expect(rendered).to match(/Payer Invitation/)
    expect(rendered).to match(/Btc Address/)
    expect(rendered).to match(/Payment Invitation/)
    expect(rendered).to match(/Payment Confirmation/)
    expect(rendered).to match(/Private Wif Key/)
    expect(rendered).to match(/Aasm State/)
  end
end

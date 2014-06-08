json.array!(@escrows) do |escrow|
  json.extract! escrow, :id, :user_id, :description, :btc_amount, :buyer_email, :seller_email, :btc_escrow_fee, :btc_seller_fee, :btc_buyer_fee, :tracking_number, :btc_amount_seller_will_receive, :max_shipping_days, :inspection_days, :payee_invitation, :payer_invitation, :btc_address, :payment_invitation, :payment_confirmation, :private_WIF_key, :aasm_state
  json.url escrow_url(escrow, format: :json)
end

class CreateEscrows < ActiveRecord::Migration
  def change
    create_table :escrows do |t|
      t.references :user, index: true
      t.text :description
      t.decimal :btc_amount
      t.string :buyer_email
      t.string :seller_email
      t.decimal :btc_escrow_fee
      t.decimal :btc_seller_fee
      t.decimal :btc_buyer_fee
      t.string :tracking_number
      t.decimal :btc_amount_seller_will_receive
      t.integer :max_shipping_days
      t.integer :inspection_days
      t.string :payee_invitation
      t.string :payer_invitation
      t.string :btc_address
      t.string :payment_invitation
      t.string :payment_confirmation
      t.string :private_WIF_key
      t.string :aasm_state

      t.timestamps
    end
  end
end

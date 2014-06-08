class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :image_url
      t.string :oauth_token
      
      t.string :aasm_state
      t.string :country_code
      t.string :postal_code
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      
      t.timestamps
    end
  end
end

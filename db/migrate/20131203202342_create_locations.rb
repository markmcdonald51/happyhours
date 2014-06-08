class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    
      t.string :full_street_address
 
=begin    
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :provider
      t.string :precision
=end      
      
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      
      t.string  :aasm_state
      t.references :locatable, index: true, polymorphic: true
      
      t.timestamps
    end
  end
end

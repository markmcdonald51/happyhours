class Add < ActiveRecord::Migration
  def change
    add_column :venues, :full_street_address, :string    
    add_column :venues, :lat, :decimal,  {:precision=>10, :scale=>6}
    add_column :venues, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end

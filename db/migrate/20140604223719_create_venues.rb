class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.string :contact_name
      t.text :description
      t.text :price
      t.string :sm_image_link
      t.string :big_image_link
      t.string :r_link
      t.string :hours
      t.text :happy_hours
      t.boolean :free_wifi
      t.string :aasm_state

      t.timestamps
    end
  end
end

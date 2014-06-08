class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.decimal :addmission_charge
      t.datetime :started_at
      t.datetime :expired_at
      t.text :schedule
      t.references :venue, index: true
      t.string :aasm_state

      t.timestamps
    end
  end
end

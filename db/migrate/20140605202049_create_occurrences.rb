class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.datetime :started_at, index: true
      t.datetime :expired_at, index: true
      t.boolean :generated
      t.datetime :canceled_at
      t.references :event, index: true

      t.timestamps
    end
  end
end

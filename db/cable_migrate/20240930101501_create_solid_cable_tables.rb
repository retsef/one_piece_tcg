class CreateSolidCableTables < ActiveRecord::Migration[7.2]
  def change
    create_table :solid_cable_messages do |t|
      t.binary :channel, null: false, index: true
      t.binary :payload, null: false, index: true
      t.datetime :created_at, null: false, index: true

      t.integer :channel_hash, limit: 8, null: false
    end
  end
end

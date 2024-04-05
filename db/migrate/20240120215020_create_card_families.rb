class CreateCardFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :card_families do |t|
      t.belongs_to :card, null: false, foreign_key: true
      t.belongs_to :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end

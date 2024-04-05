class CreateCardDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :card_decks do |t|
      t.belongs_to :card, null: false, foreign_key: true
      t.belongs_to :deck, null: false, foreign_key: true

      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end

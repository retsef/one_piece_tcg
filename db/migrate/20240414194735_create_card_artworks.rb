class CreateCardArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :card_artworks do |t|
      t.belongs_to :card, null: false, foreign_key: true
      t.string :rarity

      t.timestamps
    end
  end
end

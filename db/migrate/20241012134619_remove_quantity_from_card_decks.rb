class RemoveQuantityFromCardDecks < ActiveRecord::Migration[7.2]
  def change
    remove_column :card_decks, :quantity, :integer
  end
end

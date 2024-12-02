class AddLeaderToDecks < ActiveRecord::Migration[7.2]
  def change
    add_reference :decks, :leader, null: true, foreign_key: { to_table: :cards }
  end
end

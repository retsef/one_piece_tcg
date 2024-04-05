class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :type
      t.string :code
      t.string :rarity
      t.text :colors

      t.integer :cost, default: 0
      t.integer :power, default: 0
      t.integer :counter, default: 0

      t.text :elements
      t.text :effect
      t.text :trigger

      t.timestamps
    end
  end
end

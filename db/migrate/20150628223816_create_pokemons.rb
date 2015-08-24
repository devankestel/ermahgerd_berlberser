class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.attachment :sprite
      t.integer :number
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :height
      t.integer :weight
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :total
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end

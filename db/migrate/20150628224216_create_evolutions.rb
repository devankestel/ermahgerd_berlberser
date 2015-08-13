class CreateEvolutions < ActiveRecord::Migration
  def change
    create_table :evolutions do |t|
      t.string :name
      t.integer :level
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end

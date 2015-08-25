class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|

      t.string :name
      t.string :language
      t.string :number
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end

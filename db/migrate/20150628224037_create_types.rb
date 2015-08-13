class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.integer :pokemon_id

      t.timestamps null: false
    end
  end
end

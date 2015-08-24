class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :pokemon_id
      t.string :text

      t.timestamps null: false
    end
  end
end

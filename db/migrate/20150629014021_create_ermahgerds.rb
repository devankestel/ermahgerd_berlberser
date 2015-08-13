class CreateErmahgerds < ActiveRecord::Migration
  def change
    create_table :ermahgerds do |t|
      t.string :name
      t.string :description
      t.string :sprite
      t.string :number

      t.timestamps null: false
    end
  end
end

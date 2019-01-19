class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :reference_number
      t.references :category, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

class CreateJoinTableCategoriesRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_join_table :restaurants, :categories do |t|
      t.references :restaurant, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end

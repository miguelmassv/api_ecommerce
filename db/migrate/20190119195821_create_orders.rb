class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :payment_method
      t.string :shipping_address
      t.string :phone_number
      t.references :restaurant, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

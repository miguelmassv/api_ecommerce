class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :total_ammount

      t.timestamps
    end
  end
end

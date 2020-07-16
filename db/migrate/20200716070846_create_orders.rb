class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :members_id
      t.integer :postage
      t.integer :status
      t.integer :total_price
      t.integer :payment_method
      t.string :shipping_name
      t.string :shipping_postcode
      t.string :shipping_address
    end
  end
end
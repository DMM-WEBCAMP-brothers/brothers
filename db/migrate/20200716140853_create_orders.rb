class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :member_id
      t.integer :postage
      t.integer :status, default: 0, null: false
      t.integer :total_price
      t.integer :payment_method, default: 0, null: false
      t.string :shipping_name
      t.string :shipping_postcode
      t.string :shipping_address
    end
  end
end
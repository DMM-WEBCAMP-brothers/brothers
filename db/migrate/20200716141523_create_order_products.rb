class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|

      t.timestamps
      t.integer :order_id
      t.integer :product_id
      t.integer :total_number
      t.integer :purchase_price
      t.integer :production_status, default: 0, null: false
    end
  end
end

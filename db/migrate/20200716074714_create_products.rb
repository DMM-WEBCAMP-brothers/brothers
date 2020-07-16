class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :genre_id
      t.string :product_name
      t.text :explanation
      t.integer :rice
      t.string :image_id
      t.boolean :is_sale

    end
  end
end

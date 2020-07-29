class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :price
      t.string :image_id
      t.boolean :is_sale, default: true, null: false
    end
  end
end

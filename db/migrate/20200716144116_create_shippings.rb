class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.integer :member_id
      t.string :postcode
      t.string :name
      t.string :address
    end
  end
end

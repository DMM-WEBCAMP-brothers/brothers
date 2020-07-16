class RemoveRiceFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :rice, :integer
  end
end

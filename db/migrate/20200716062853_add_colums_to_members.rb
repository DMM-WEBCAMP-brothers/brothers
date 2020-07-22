class AddColumsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :last_name_kana, :string
    add_column :members, :first_name_kana, :string
    add_column :members, :address, :string
    add_column :members, :postcode, :string
    add_column :members, :phone_number, :string
    add_column :members, :is_deleted, :boolean, default: false, null: false
  end
end

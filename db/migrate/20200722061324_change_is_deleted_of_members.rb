class ChangeIsDeletedOfMembers < ActiveRecord::Migration[5.2]

  def up
    change_column :members, :is_deleted, :boolean, default: false, null: false
  end

  def down
    change_column :members, :is_deleted, :boolean
  end

end

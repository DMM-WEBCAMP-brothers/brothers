class RemoveMembersIdFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :members_id, :integer
  end
end

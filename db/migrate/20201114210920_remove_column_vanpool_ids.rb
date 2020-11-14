class RemoveColumnVanpoolIds < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :vanpool_ids
  end
end

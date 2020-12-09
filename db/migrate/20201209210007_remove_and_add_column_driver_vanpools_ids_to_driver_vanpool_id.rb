class RemoveAndAddColumnDriverVanpoolsIdsToDriverVanpoolId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :driver_vanpool_ids
    add_column :users, :driver_vanpool_id, :integer
  end
end

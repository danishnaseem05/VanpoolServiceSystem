class AddAndRemoveColumnDriverVanpoolIdsAndDriverVanpoolId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :driver_vanpool_id, :integer
    add_column :users, :driver_vanpool_ids, :text, default: [].to_yaml
  end
end

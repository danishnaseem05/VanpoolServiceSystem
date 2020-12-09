class RenameColumnVanpoolIds < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :vanpool_ids, :rider_vanpool_ids
  end
end

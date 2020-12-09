class AddColumnDriverVanpoolIds < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :driver_vanpool_ids, :text, default: [].to_yaml
  end
end

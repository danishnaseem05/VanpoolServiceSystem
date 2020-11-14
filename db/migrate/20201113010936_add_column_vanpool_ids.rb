class AddColumnVanpoolIds < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :vanpool_ids, :integer, array:true, default: []
  end
end

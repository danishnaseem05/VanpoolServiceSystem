class AddColumnAgainVanpoolIds < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :vanpool_ids, :text, default: [].to_yaml
  end
end

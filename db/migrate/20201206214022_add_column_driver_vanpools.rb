class AddColumnDriverVanpools < ActiveRecord::Migration[6.1]
  def change
    add_column :vanpools, :driver, :integer
  end
end

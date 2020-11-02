class AddRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :driver, :boolean
    add_column :users, :rider, :boolean
  end
end

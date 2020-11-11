class CreateVanpools < ActiveRecord::Migration[6.1]
  def change
    create_table :vanpools do |t|
      t.string 'name'
      t.string 'cost'
      t.integer 'current_capacity'
      t.integer 'max_capacity'
      t.string 'start_time'
      t.string 'end_time'
      t.string 'pickup_location'
      t.string 'dropoff_location'
      t.timestamps
    end
  end
end

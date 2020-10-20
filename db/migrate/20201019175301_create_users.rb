class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps
      t.string 'user_id'
      t.string 'email'
      t.string 'session_token'
      t.string 'password'

            #   t.string :encrypted_password, limit: 128, null: false
            #t.string :confirmation_token, limit: 128
            #t.string :remember_token, limit: 128, null: false
    end


          # add_index :users, :email
          #add_index :users, :remember_token


  end
end

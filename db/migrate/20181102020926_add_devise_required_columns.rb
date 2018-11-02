class AddDeviseRequiredColumns < ActiveRecord::Migration[5.2]
	def change
    change_table :users do |t|
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # Confirmable
      t.string   :confirmation_token

    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end



 

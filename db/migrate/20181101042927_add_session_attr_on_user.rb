class AddSessionAttrOnUser < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :password, :string
		add_column :users, :password_confirmation, :string
		add_column :users, :remember_me, :string
		add_column :users, :encrypted_password, :string
		add_column :users, :confirmed_at, :string
	end
end

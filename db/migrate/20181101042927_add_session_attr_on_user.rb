class AddSessionAttrOnUser < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :password, :string
		add_column :users, :password_confirmation, :string
		add_column :users, :remember_me, :string
		add_column :users, :encrypted_password, :string
		add_column :users, :confirmed_at, :string
		add_column :users, :locked_at, :datetime
		add_column :users, :confirmation_sent_at, :datetime
		add_column :users, :remember_created_at, :datetime
	end
end

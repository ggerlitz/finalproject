class AddNewColumnsToUsersTable < ActiveRecord::Migration
  def change
  	remove_column :users, :full_name, :string
  	remove_column :users, :last_reminded, :integer
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :email_frequency, :integer
  	add_column :users, :sms_frequency, :integer
  end
end

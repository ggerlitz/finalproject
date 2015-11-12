class AddLastRemindedtoUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :last_reminded, :integer
  end
end

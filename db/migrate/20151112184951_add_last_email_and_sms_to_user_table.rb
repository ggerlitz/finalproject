class AddLastEmailAndSmsToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :last_email, :datetime
  	add_column :users, :last_sms,  :datetime
  end
end

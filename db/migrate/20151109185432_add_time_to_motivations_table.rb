class AddTimeToMotivationsTable < ActiveRecord::Migration
  def change
  	add_column :motivations, :reminder_frequency, :datetime
  end
end

class RenameInspirationTableToMotivationTable < ActiveRecord::Migration
  def change
  	rename_table :inspirations, :motivations
  end
end

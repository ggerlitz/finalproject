class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end

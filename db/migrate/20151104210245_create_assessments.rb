class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :q9
      t.string :q10
      t.string :passion_one
      t.string :passion_two
      t.string :passion_three
      t.string :passion_four
      t.string :passion_five

      t.timestamps null: false
    end
  end
end

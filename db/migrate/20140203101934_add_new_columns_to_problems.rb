class AddNewColumnsToProblems < ActiveRecord::Migration
  def change
    change_table :problems do |t|
      t.text :input
      t.text :output
      t.text :example_input
      t.text :example_output
      t.text :hint
    end
  end
end

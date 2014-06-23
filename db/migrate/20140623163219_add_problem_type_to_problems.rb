class AddProblemTypeToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :problem_type, :integer
  end
end

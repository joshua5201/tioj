class AddProblemIdToTestdata < ActiveRecord::Migration
  def change
    add_column :testdata, :problem_id, :integer
  end
end

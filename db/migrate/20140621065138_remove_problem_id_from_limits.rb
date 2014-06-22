class RemoveProblemIdFromLimits < ActiveRecord::Migration
  def change
    remove_column :limits, :problem_id, :integer
  end
end

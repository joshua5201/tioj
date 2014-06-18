class AddVisiblestateToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :visible_state, :integer, :default => 0
  end
end

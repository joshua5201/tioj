class AddOldPidToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :old_pid, :integer
  end
end

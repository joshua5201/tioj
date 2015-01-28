class AddNewIndexToSubmissions < ActiveRecord::Migration
  def change
    add_index :submissions, [:result]
    add_index :submissions, [:user_id]
    add_index :submissions, [:problem_id]
    add_index :submissions, [:contest_id]
  end
end

class AddProblemIdAndUserIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :problem_id, :integer
    add_column :submissions, :user_id, :integer
  end
end

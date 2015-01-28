class AddIndexToVariousForiegnKeys < ActiveRecord::Migration
  def change
    add_index :articles, [:category, :pinned, :era]
    add_index :attachments, [:article_id]
    add_index :comments, [:user_id]
    add_index :comments, [:post_id]
    add_index :posts, [:user_id]
    add_index :posts, [:updated_at]
    add_index :contest_problem_joints, [:contest_id, :problem_id], :unique => true, :name => "contest_task_ix"
    add_index :contests, [:start_time, :end_time]
    add_index :limits, [:testdatum_id]
    add_index :problems, [:name]
    add_index :submissions, [:result, :user_id, :problem_id, :contest_id], :name => "submissions_index"
    add_index :submissions, [:total_time, :total_memory], :name => "submissions_sort_ix"
    add_index :testdata_sets, [:problem_id]
    
  end
end

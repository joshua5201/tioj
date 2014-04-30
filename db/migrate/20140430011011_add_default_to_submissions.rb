class AddDefaultToSubmissions < ActiveRecord::Migration
  def change
	change_column :submissions, :code, :text
	change_column :submissions, :compiler, :string, :default => ""
	change_column :submissions, :result, :string, :default => "queued"
	change_column :submissions, :score, :integer ,:default => 0
	change_column :submissions, :problem_id, :integer, :default => 0
	change_column :submissions, :user_id, :integer, :default => 0
  end
end

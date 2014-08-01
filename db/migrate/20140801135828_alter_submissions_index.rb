class AlterSubmissionsIndex < ActiveRecord::Migration
  def change
    remove_index :submissions, :name => "submissions_index"
  end
end

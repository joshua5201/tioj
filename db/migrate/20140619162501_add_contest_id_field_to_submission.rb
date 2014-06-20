class AddContestIdFieldToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :contest_id, :integer
  end
end

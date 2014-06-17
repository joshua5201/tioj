class CreateContestProblemJoints < ActiveRecord::Migration
  def change
    create_table :contest_problem_joints do |t|
      t.integer :contest_id
      t.integer :problem_id
      
      t.timestamps
    end
  end
end

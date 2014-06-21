class CreateTestdataSets < ActiveRecord::Migration
  def change
    create_table :testdata_sets do |t|
      t.integer :problem_id
      t.integer :from
      t.integer :to
      t.integer :score
      
      t.timestamps
    end
  end
end

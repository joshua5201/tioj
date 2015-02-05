class AddIndexByCompilerOnSubmission < ActiveRecord::Migration
  def change
    add_index :submissions, [:compiler]
  end
end

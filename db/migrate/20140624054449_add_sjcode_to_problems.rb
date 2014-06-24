class AddSjcodeToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :sjcode, :text
  end
end

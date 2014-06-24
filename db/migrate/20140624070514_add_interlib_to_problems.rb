class AddInterlibToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :interlib, :text
  end
end

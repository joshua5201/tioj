class AddForeignKeyToLimit < ActiveRecord::Migration
  def change
    add_column :limits, :problem_id, :integer
  end
end

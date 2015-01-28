class ChangeResultToString < ActiveRecord::Migration
  def change
    change_column :submissions, :_result, :text, :limit => 10000
  end
end

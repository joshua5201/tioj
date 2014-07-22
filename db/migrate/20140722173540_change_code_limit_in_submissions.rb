class ChangeCodeLimitInSubmissions < ActiveRecord::Migration
  def change
    change_column :submissions, :code, :text, :limit => 5000000
    change_column :problems, :sjcode, :text, :limit => 5000000
    change_column :problems, :interlib, :text, :limit => 5000000
  end
end

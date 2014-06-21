class AddResultToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :_result, :string
  end
end

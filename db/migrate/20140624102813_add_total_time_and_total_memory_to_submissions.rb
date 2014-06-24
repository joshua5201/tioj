class AddTotalTimeAndTotalMemoryToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :total_time, :integer
    add_column :submissions, :total_memory, :integer
  end
end

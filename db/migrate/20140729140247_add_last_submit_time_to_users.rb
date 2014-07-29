class AddLastSubmitTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_submit_time, :datetime
  end
end

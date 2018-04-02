class AddMessageToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :message, :text
  end
end

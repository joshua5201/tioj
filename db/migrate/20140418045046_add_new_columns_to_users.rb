class AddNewColumnsToUsers < ActiveRecord::Migration
  def change
	add_column :users,  :nickname, :string
	add_column :users, :avatar_url, :string
  end
end

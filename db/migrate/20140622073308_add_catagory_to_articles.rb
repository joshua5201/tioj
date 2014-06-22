class AddCatagoryToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :catagory, :integer
  end
end

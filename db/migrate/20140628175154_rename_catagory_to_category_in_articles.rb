class RenameCatagoryToCategoryInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :catagory, :category
  end
end

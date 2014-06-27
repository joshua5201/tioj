class RenameColumnOfArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :arthur_id, :author_id
  end
end

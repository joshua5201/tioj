class AddPinnedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pinned, :bool
  end
end

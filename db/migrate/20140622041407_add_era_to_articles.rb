class AddEraToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :era, :integer
  end
end

class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.text :description
      t.text :source

      t.timestamps
    end
  end
end

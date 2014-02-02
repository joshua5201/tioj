class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.string :compiler
      t.string :result
      t.integer :score

      t.timestamps
    end
  end
end

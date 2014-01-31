class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.integer :time
      t.integer :memory
      t.integer :output

      t.timestamps
    end
  end
end

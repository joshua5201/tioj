class CreateTestdata < ActiveRecord::Migration
  def change
    create_table :testdata do |t|
      t.text :input
      t.text :answer

      t.timestamps
    end
  end
end

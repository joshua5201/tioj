class AddTestdatumIdToLimits < ActiveRecord::Migration
  def change
    add_column :limits, :testdatum_id, :integer
  end
end

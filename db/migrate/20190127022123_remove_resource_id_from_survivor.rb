class RemoveResourceIdFromSurvivor < ActiveRecord::Migration[5.1]
  def change
    remove_column :survivors, :resource_id, :integer
  end
end

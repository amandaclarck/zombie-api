class AddResoucesToSurvivors < ActiveRecord::Migration[5.1]
  def self.up
    create_table :resources_survivors do |t|
      t.references :resource, :survivor
    end
  end

  def self.down
    drop_table :resources_survivors
  end
end

# frozen_string_literal: true

class AddResourceToResourcesSurvivor < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :resources_survivors, :resources, column: :resource_id
  end
end

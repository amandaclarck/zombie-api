# frozen_string_literal: true

class AddSurvivorToResourcesSurvivor < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :resources_survivors, :survivors, column: :survivor_id
  end
end

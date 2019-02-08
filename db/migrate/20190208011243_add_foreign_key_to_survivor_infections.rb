# frozen_string_literal: true

class AddForeignKeyToSurvivorInfections < ActiveRecord::Migration[5.2]
  def change
    add_reference :survivors, :survivor_infection, foreign_key: true
  end
end

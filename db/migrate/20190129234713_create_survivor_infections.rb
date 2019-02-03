# frozen_string_literal: true

class CreateSurvivorInfections < ActiveRecord::Migration[5.1]
  def change
    create_table :survivor_infections do |t|
      t.references :survivor_indicator
      t.references :survivor_infected
    end
  end
end

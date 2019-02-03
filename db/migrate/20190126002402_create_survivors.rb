# frozen_string_literal: true

class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.boolean :infected, default: false
      t.float :latitude
      t.float :longitude
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end

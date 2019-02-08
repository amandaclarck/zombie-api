# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_208_011_243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'resources', force: :cascade do |t|
    t.string 'name'
    t.integer 'points'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'resources_survivors', force: :cascade do |t|
    t.bigint 'resource_id'
    t.bigint 'survivor_id'
    t.index ['resource_id'], name: 'index_resources_survivors_on_resource_id'
    t.index ['survivor_id'], name: 'index_resources_survivors_on_survivor_id'
  end

  create_table 'survivor_infections', force: :cascade do |t|
    t.bigint 'survivor_indicator_id'
    t.bigint 'survivor_infected_id'
    t.index ['survivor_indicator_id'], name: 'index_survivor_infections_on_survivor_indicator_id'
    t.index ['survivor_infected_id'], name: 'index_survivor_infections_on_survivor_infected_id'
  end

  create_table 'survivors', force: :cascade do |t|
    t.string 'name'
    t.integer 'age'
    t.string 'gender'
    t.boolean 'infected', default: false
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'survivor_infection_id'
    t.index ['survivor_infection_id'], name: 'index_survivors_on_survivor_infection_id'
  end

  add_foreign_key 'resources_survivors', 'resources'
  add_foreign_key 'resources_survivors', 'survivors'
  add_foreign_key 'survivors', 'survivor_infections'
end

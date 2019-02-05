# frozen_string_literal: true

class Survivor < ApplicationRecord
  has_and_belongs_to_many :resources
  has_many :survivor_indicator, class_name: 'Survivor', foreign_key: 'survivor_id'
  has_many :survivor_infected, class_name: 'Survivor', foreign_key: 'survivor_id'
  accepts_nested_attributes_for :resources

	validates :name, presence: true, on: :create
	validates :age, presence: true, on: :create
	validates :latitude, presence: true, on: :create, on: :update 
	validates :longitude, presence: true, on:  :create, on: :update 
	validates :infected, presence: true, on: :update
	validates :gender, presence: true, inclusion: { in: %w(P M U), message: "Gender must be F, M or U" }, on: :create
	validates :resources, presence: true, on: :create
end

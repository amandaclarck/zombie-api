# frozen_string_literal: true

class Survivor < ApplicationRecord
  has_and_belongs_to_many :resources
  has_many :survivor_indicator, class_name: 'Survivor', foreign_key: 'survivor_id'
  has_many :survivor_infected, class_name: 'Survivor', foreign_key: 'survivor_id'

	validates :name, presence: true
	validates :age, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :infected, presence: true, on: :update
	validates :gender, presence: true, inclusion: { in: %w(P M U), message: "Gender must be F, M or U" }, on: :create
	validates :resources, presence: true
end

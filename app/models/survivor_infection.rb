class SurvivorInfection < ApplicationRecord
	belongs_to :survivor_indicator, :class_name => 'Survivor'
  belongs_to :survivor_infected, :class_name => 'Survivor'
end

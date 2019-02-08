# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SurvivorInfection, type: :model do
  context '#relationship' do
    it { should belong_to(:survivor_indicator) }
    it { should belong_to(:survivor_infected) }
  end
end

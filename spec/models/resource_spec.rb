# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  context '#relationship' do
    it { should have_and_belong_to_many(:survivors) }
  end
end

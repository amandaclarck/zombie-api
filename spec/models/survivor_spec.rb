# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Survivor, type: :model do
  context '#validation' do
    describe 'on create' do
      it { should validate_presence_of(:name).on(:create) }

      it { should validate_presence_of(:age).on(:create) }

      it { should validate_presence_of(:gender).on(:create) }

      it { should validate_presence_of(:latitude).on(:create) }

      it { should validate_presence_of(:longitude).on(:create) }

      it { should validate_presence_of(:resources).on(:create) }
    end

    describe 'on update' do
      it { should validate_presence_of(:latitude).on(:update) }
      it { should validate_presence_of(:longitude).on(:update) }
    #  it { should validate_presence_of(:infected).on(:update) }
    end
  end
end

require 'rails_helper'

RSpec.describe Survivor, type: :model do
	context '#validation' do
	  it { should validate_presence_of(:name) }

	  it { should validate_presence_of(:age) }

	  it { should validate_presence_of(:gender) }

	  describe 'validates presence of location' do
  		it { should validate_presence_of(:latitude) }
			it { should validate_presence_of(:longitude) }
	  end
	end
end


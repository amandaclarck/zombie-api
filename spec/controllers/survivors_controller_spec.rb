require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do
=begin
	context '#new' do
		setup do
    		create(:resource, id: 1)
  		end
	    resource = { id: 1, resource: { activated: true } }
		describe 'success' do


			it 'creates a new survivor' do
		    params = {
		      survivor: {
		        name: 'Code',
		        age: '12',
		        gender: 'F',
		        latitude: 123,
		        longitude: 456,
		        infected: false,
						resources: resource
		      }
		    }
		    should permit(:name, :age, :gender, :latitude, :longitude, :infected, resources: resource).
		      for(:create, params: params).
		      on(:survivor)
			end
		end


		describe 'failure' do
		end
	end
end
=end
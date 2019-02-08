require 'rails_helper'
#require 'factories'

RSpec.describe SurvivorsController, type: :controller do
	context '#create' do
		$resource = Resource.create!(name: 'Water', points: 1)

		it 'should create a new survivor' do
			params = {
                 survivor: {
                   name: 'Teste',
                   age: 13,
                   gender: 'M',
                   latitude: 31313123123.33333,
                   longitude: 450.9,
                   resources:  { id: $resource.id }
                 }
               }

			should permit(:name, :age, :gender, :latitude, :longitude, resources: []).
                for(:create, params: params).
                on(:survivor)
    end
	end
end
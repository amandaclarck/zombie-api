# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :survivors
  resources :resources
  post 'mark_as_infected/', action: :mark_as_infected, to: 'survivors#mark_as_infected'
  get	'resources_per_survivor/:survivor_id', action: :resources_per_survivor, to: 'resources#resources_per_survivor'
  resources :survivors do
  end
end

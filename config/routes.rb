# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :survivors
  resources :resources

  #survivors
  get 'index', action: :index, to: 'survivor#index'
  post 'mark_as_infected', action: :mark_as_infected, to: 'survivors#mark_as_infected'
  post 'exchange_resources', action: :exchange_resources, to: 'survivors#exchange_resources'

  #resources
  get 'resources', action: :index, to: 'resources#index'
  get	'resources_per_survivor/:survivor_id', action: :resources_per_survivor, to: 'resources#resources_per_survivor'

  #reports
  get 'reports', action: :index, to: 'reports#index'
end

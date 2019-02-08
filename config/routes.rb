# frozen_string_literal: true

Rails.application.routes.draw do
  # survivors
  get 'survivors', action: :index, to: 'survivors#index'
  get 'survivors/:id', action: :show, to: 'survivors#show'
  post 'create', action: :create, to: 'survivors#create'
  post 'update', action: :update, to: 'survivors#update'
  post 'mark_as_infected', action: :mark_as_infected, to: 'survivors#mark_as_infected'
  post 'exchange_resources', action: :exchange_resources, to: 'survivors#exchange_resources'
  put 'survivors/:id', action: :update, to: 'survivors#update'

  # resources
  get 'resources', action: :index, to: 'resources#index'
  get 'resources_per_survivor', action: :resources_per_survivor, to: 'resources#resources_per_survivor'

  # reports
  get 'reports', action: :index, to: 'reports#index'
end

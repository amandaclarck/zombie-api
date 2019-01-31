Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :survivors
  resources :resources

  resources :survivors do
    post 'mark_as_infected/:survivor_infected/:infected', action: :mark_as_infected, to: 'survivors#mark_as_infected'
  end
end

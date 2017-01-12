Rails.application.routes.draw do
  resources :short_visits, only: [:show, :index, :destroy]
  resources :short_urls, except: [:new, :edit]
  resources :users, except: [:new, :edit, :index]
  
  get ':shorty' => 'short_urls#shorty'

  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

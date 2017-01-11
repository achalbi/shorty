Rails.application.routes.draw do
  resources :short_urls
  resources :short_visits
  resources :short_visits, except: [:new, :edit]
  resources :short_urls, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

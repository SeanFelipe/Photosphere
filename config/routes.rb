Rails.application.routes.draw do
  resources :specs
  resources :run_records
  post '/search', to: 'search#search'
end

Rails.application.routes.draw do
  # namespace :admin do
  #   resources :movies
  # end

  get 'admin/movies/', to:'admin/movies#index'

  get 'admin/movies/new', to:'admin/movies#new'
  post 'admin/movies', to:'admin/movies#create'

  get 'admin/movies/:id', to:'admin/movies#show'

  get 'admin/movies/:id/edit', to:'admin/movies#edit'
  patch 'admin/movies/:id', to:'admin/movies#update'

  delete 'admin/movies/:id', to:'admin/movies#destroy'
  
  get 'movies', to:'movies#index'
  get 'sheets', to:'sheets#index'
  get 'movies/:id', to:'movies#show'
  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

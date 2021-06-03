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
  
  get 'admin/schedules', to:'admin/schedules#index'
  get 'admin/schedules/:id', to:'admin/schedules#show'
  get 'admin/movies/:id/schedules/new', to:'admin/schedules#new'
  post 'admin/schedules', to:'admin/schedules#create'
  get 'admin/schedules/:id/edit', to:'admin/schedules#edit'
  patch 'admin/schedules/:id', to:'admin/schedules#update'
  delete 'admin/schedules/:id', to:'admin/schedules#destroy'

    
  get 'movies', to:'movies#index'
  get 'sheets', to:'sheets#index'
  get 'movies/:id', to:'movies#show'
  get 'movies/:movie_id/schedules/:schedule_id/sheets', to:'sheets#reserve_sheets'
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: 'reservations#new'
  post 'movies/:movie_id', to:'reservations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'admin/movies/', to:'admin/movies#index'

  get 'movies', to:'movies#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

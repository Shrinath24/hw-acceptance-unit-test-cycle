Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/same_director_movies/:id' , to: 'movies#same_director_movies', as: 'same_director_movies'
end

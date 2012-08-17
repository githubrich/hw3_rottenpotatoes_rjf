Rottenpotatoes::Application.routes.draw do
  resources :movies
  
  # match "/movies/directed_by/:director" => "movies#directed_by" #, :as => foo
  match "/movies/directed_by/:title" => "movies#directed_by", :as => :movie_directed_by
  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

end

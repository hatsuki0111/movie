class MoviesController < ApplicationController
  def index
  
    @search = params["search"]
    @is_showing = params["is_showing"]
    
    @movies = Movie.search(@search, @is_showing)
  end

end

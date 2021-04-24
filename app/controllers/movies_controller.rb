class MoviesController < ApplicationController
  def index
    @movie = Movie.all
    @title_image = Movie.select("name, image_url").limit(1)
  end
end

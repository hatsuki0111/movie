class MoviesController < ApplicationController
  def index
  
    @search = params["search"]
    @is_showing = params["is_showing"]
    
    @movies = Movie.search(@search, @is_showing)
  end

  def show
    @movie_record = Movie.find(params[:id])

    @schedules = @movie_record.schedules
    # @movie_id = Movie.
    #  @movie_id.schedules.find(params[:id])
    #  current_user
    # @schedules = Schedule.select(:start_time.:end_time).where(movie_id: @arams[:id]);

  end


end

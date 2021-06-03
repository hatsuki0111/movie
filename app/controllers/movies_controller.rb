class MoviesController < ApplicationController
  def index
  
    @search = params["search"]
    @is_showing = params["is_showing"]
    
    @movies = Movie.search(@search, @is_showing)
  end

  def show
    @movie_record = Movie.find(params[:id])

    @schedules =  @movie_record.schedules.order(start_time: :ASC)
    @schedule_id = Schedule.find_by(movie_id: params[:id])
    @schedule_all = Schedule.all
  end
end

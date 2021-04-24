class Admin::MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def show
    @movie_id = Movie.where(id: params[:id])
  end

  def new
    @post = Movie.new
  end

  def create
    @posted = Movie.new
    @posted.name = params[:movie][:name]
    @posted.year = params[:movie][:year]
    @posted.description = params[:movie][:description]
    @posted.image_url = params[:movie][:image_url]
    @posted.is_showing = params[:movie][:is_showing]

    # @posted = Movie.create(post_params)
   
    if @posted.save
      redirect_to '/admin/movies' ,notice: '映画情報が送信されました'
    else
      flash[:alert] = '映画情報を入力してください'
       redirect_to '/admin/movies/new'
    end
   end

  #  def post_params
  #     params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  #  end
end

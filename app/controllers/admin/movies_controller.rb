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
      redirect_to '/admin/movies' ,notice: '映画情報が作成されました'
    else
      flash[:alert] = '映画情報を入力してください'
       redirect_to '/admin/movies/new'
    end
   end


  #  def post_params
  #     params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  #  end


  def edit
    @put = Movie.find_by(id: params[:id])
  end

  def update
    @puted = Movie.find_by(id: params[:id])
    @puted.name = params[:movie][:name]
    @puted.year = params[:movie][:year]
    @puted.description = params[:movie][:description]
    @puted.image_url = params[:movie][:image_url]
    @puted.is_showing = params[:movie][:is_showing]

    if @puted.save
      redirect_to "/admin/movies",notice: '映画情報が更新されました'
    else
      flash[:alert] = '映画情報を入力してください'
       redirect_to "/admin/movies/#{@puted.id}/edit"
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])

    if @movie.destroy
      redirect_to "/admin/movies",notice: '映画情報が削除されました'
    else 
      flash[:alert] = '映画情報の削除に失敗しました'
       redirect_to "/admin/movies/#{@movie.id}/edit"
    end
  end

end

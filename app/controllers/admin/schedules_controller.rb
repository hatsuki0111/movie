class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    #メソッドでモデルに書く
    @movies_schedules = Movie.joins(:schedules).select('movies.*, schedules.start_time,schedules.end_time').order(start_time: :ASC)

  end

  def show  
     @movies_schedules =   Schedule.where(movie_id: params[:id]).order(start_time: :ASC)
  end

  def new
    @post = Movie.new
  end

  def create
    @movie_record = Movie.find_by( params[:movie][:id])
    @schedules = @movie_record.schedules.create(start_time: params[:movie][:start_time], end_time: params[:movie][:end_time])
  
    if @schedules.save
      redirect_to '/admin/schedules' ,notice: '上映スケジュールが作成されました'
    else
      flash[:alert] = '上映スケジュールを入力してください'
       redirect_to "/admin/movies/#{@schedules.movie_id}/schdules/new"
    end
  end

  def edit
    @put = Schedule.find_by(id: params[:id])
  end

  def update
    @puted = Schedule.find_by(id: params[:id])
    @puted.start_time = params[:schedule][:start_time]
    @puted.end_time = params[:schedule][:end_time]

    if @puted.save
      redirect_to "/admin/schedules/#{@puted.movie_id}",notice: '上映スケジュールが更新されました'
    else
      flash[:alert] = '上映スケジュールを入力してください'
       redirect_to "/admin/schedules/#{@puted.id}/edit"
    end
  end

  def destroy
    @schedule = Schedule.find_by(id: params[:id])

    if @schedule.destroy
      redirect_to "/admin/schedules/#{@schedule.movie_id}",notice: '映画情報が削除されました'
    else 
      flash[:alert] = '映画情報の削除に失敗しました'
       redirect_to "/admin/schedules/#{@schedule.id}/edit"
    end
  end

end

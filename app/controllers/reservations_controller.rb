class ReservationsController < ApplicationController
  def new
  
   @date = params[:date]
   @sheet_id = params[:sheet_id]

  end

  def create
    #登録
    @movie_record = Movie.find_by( params[:movie][:id])
    @schedules = @movie_record.schedules.create(start_time: params[:movie][:start_time], end_time: params[:movie][:end_time])
  
    if @schedules.save
      redirect_to '/admin/schedules' ,notice: '上映スケジュールが作成されました'
    else
      flash[:alert] = '上映スケジュールを入力してください'
       redirect_to "/admin/movies/#{@schedules.movie_id}/schdules/new"
    end
  end
end

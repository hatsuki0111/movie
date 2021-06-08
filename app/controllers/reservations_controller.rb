class ReservationsController < ApplicationController
  def new
  
   @date = params[:date]
   @sheet_id = params[:sheet_id]
   @movie_id = params[:movie_id]
   @schedule_id = params[:schedule_id]
   @post = Reservation.new


  end

  def create
    @puted = Reservation.new
    @movie_id = params[:reservation][:movie_id]
    @puted.schedule_id = params[:reservation][:schedule_id]
    @puted.sheet_id = params[:reservation][:sheet_id]
    @puted.date = Date.parse(params[:reservation][:date])
    @puted.name = params[:reservation][:name]
    @puted.email = params[:reservation][:mail].downcase
  

    # @week = %w(日 月 火 水 木 金 土)[@puted.date.wday]
    if Reservation.exists?(schedule_id: @puted.schedule_id, sheet_id: @puted.sheet_id)
      redirect_to "/movies/#{@movie_id}/schedules/#{@puted.schedule_id}/sheets?date=#{params[:reservation][:date]}",notice: 'その座席はすでに予約済みです'
    elsif @puted.save
      redirect_to "/movies/#{@movie_id}" ,notice: '予約が完了しました'
    else
      flash[:alert] = '名前とメールアドレスのフォームが空か正しくない形式です'
       redirect_to "/movies/#{@movie_id}/schedules/#{@puted.schedule_id}/reservations/new?date=#{@puted.date}&sheet_id=#{@puted.sheet_id}"
    end
  end
end

# 送信時にすでに同じスケジュールの同じ座席に予約があったら「その座席はすでに予約済みです」と表示し、
# `/movies/:movie_id/schedules/:schedule_id/sheets?date=YYYY-MM-DD` に飛ばす

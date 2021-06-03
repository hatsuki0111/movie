class SheetsController < ApplicationController
    def index
        @sheets = Sheet.select(:row, :column)
    end
  
    def reserve_sheets
        @sheets = Sheet.select(:id,:row, :column)
    
        @schedule_id = Schedule.find_by(movie_id: params[:movie_id])
       
        #使わないが日付をとってくる
       
        @date = params[:schedule][:date]
    end
  end
class SheetsController < ApplicationController
    def index
        @sheets = Sheet.select(:row, :column)
    end
  
    def reserve_sheets
        @sheets = Sheet.select(:id,:row, :column)
    
        @schedule_id = Schedule.find_by(movie_id: params[:movie_id])
       
       if params[:date]
        @date = params[:date]           
       else 
        @date = params[:schedule][:date]
       end
    
       @sheet_enable_arrays = Array.new(15, true)

        (0..14).each_with_index do |column|
            if !!Reservation.where(date: @date,schedule_id:  column)
                @sheet_enable_arrays[column] = false
            end
        end
        binding.pry
    end
  end



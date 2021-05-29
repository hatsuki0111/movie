class SheetsController < ApplicationController
    def index
        @sheets = Sheet.select(:row, :column)
    end
  
  end
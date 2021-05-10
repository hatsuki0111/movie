class SheetsController < ApplicationController
    def index
        @sheets = Sheet.pluck(:row, :column)
    end
  
  end
class Schedule < ApplicationRecord
    belongs_to :movie


    def start_time_and_end_time
        self.start_time.strftime('%H:%M') + "～"+ self.end_time.strftime('%H:%M')
     end

end
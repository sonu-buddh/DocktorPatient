module AvailabilitiesHelper
    def get_available_doctor(date)
        date = date.to_date
        today = Date.today
        start_date = today.beginning_of_week(bigining_day = :monday)
        end_date = today.end_of_week(end_day = :monday)
        
        Availability.joins(:user).where("available_date >= :start_date AND available_date <= :end_date", {start_date: date, end_date: date}).pluck("users.name, users.id").uniq
    end

    def create_time_slot(start_time, end_time)
        range1 = []
        (start_time.to_time.to_i..end_time.to_time.to_i).step(1.hour) do |time|
          range1 << time
        end
        range1
    end
end

class Availability < ApplicationRecord
    belongs_to :user

    def booked!
        update(status: 'booked')
    end
end

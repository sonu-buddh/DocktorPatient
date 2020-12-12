class Appoinment < ApplicationRecord
    belongs_to :user

    def approve!
        update(status: 'approved')
    end

    def reject!
        update(status: 'rejected')
    end
end

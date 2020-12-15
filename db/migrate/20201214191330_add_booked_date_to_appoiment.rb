class AddBookedDateToAppoiment < ActiveRecord::Migration[6.0]
  def change
    remove_column :appoinments, :available_start
    remove_column :appoinments, :available_end
    add_column :appoinments, :booked_date , :datetime
  end
end

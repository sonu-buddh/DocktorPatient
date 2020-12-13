class AddAvailableStartEndToAppoinment < ActiveRecord::Migration[6.0]
  def change
    add_column :appoinments, :available_start, :datetime
    add_column :appoinments, :available_end, :datetime
  end
end

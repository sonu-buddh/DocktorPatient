class AddStatusToAvailability < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :status, :string
  end
end

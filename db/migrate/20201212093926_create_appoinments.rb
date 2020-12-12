class CreateAppoinments < ActiveRecord::Migration[6.0]
  def change
    create_table :appoinments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end

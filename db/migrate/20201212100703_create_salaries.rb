class CreateSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :salaries do |t|
      t.integer :january
      t.integer :february
      t.integer :march
      t.integer :april
      t.integer :may
      t.integer :june
      t.integer :july
      t.integer :august
      t.integer :september
      t.integer :october
      t.integer :november
      t.integer :december

      t.timestamps
    end
  end
end

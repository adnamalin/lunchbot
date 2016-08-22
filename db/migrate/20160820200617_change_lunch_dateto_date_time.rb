class ChangeLunchDatetoDateTime < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :lunch_date, :datetime
  end
end

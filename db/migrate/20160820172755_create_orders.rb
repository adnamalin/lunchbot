class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :team, index: true
      t.string :owner, index: true 
      t.string :restaurant
      t.date :lunch_date
    end
  end
end

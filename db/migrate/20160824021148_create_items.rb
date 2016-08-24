class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :owner
      t.string :name
      t.string :notes
      t.integer :order_id
      t.string :username

      t.timestamps
    end
  end
end

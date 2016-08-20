class AddMenuLinkToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :menu, :string
  end
end

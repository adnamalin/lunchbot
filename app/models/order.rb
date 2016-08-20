class Order < ApplicationRecord

  def self.print_all_orders(channel)
    orders = Order.where(channel: channel).order(id: :asc)
    orders.map {|o| "Order ##{o.id}: #{o.name} #{o.restaurant} #{o.lunch_date.strftime("%B %d, %Y at %I:%M")} \n"}.join(" ")
  end

  def print_single_order
    "#{self.id}: #{self.name} \n #{self.restaurant} on #{self.lunch_date.strftime("%B %d, %Y at %I:%M")} \n #{self.menu}"
  end

end

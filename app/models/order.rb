class Order < ApplicationRecord
  has_many :items, dependent: :destroy

  def self.order_by_channel(channel)
    Order.where(channel: channel).order(id: :asc)
  end

  def self.print_all_orders(orders)
    orders.map {|o| "```Order ##{o.id}: #{o.name.capitalize} | #{o.restaurant.capitalize} at #{o.lunch_date.strftime("%B %d, %Y at %I:%M")}```"}.join(" ")
  end

  def print_single_order
    details = "*Order ##{self.id}: #{self.name.capitalize} | #{self.restaurant.capitalize} at #{self.lunch_date.strftime("%B %d, %Y at %I:%M")}* \n #{self.menu}"
    if self.items.any?
      details += "\n ```#{self.print_items}```"
    end
    details
  end

  def print_items
    self.items.map.with_index {|item, index| "#{index + 1} #{item.username}: #{item.name} #{item.notes} \n"}.join("")
  end

end

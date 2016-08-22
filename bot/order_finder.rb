module OrderFinder

  def find_order(id)
    order = Order.order_by_channel(data.channel).where(id: id)
    if order != []
      order.first
    else
      nil
    end
  end
  
end

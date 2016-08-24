class DeleteItem < SlackRubyBot::Commands::Base
   command 'delete from order' do |client, data, match|
    order_details = match['expression'].split(", ")
    order_num = order_details[0]
    item_num = order_details[1].to_i
    order = Order.order_by_channel(data.channel).where(id: order_num)
    if order != []
      order.first.items[item_num - 1].delete
      client.say(channel: data.channel, text: "Item #{item_num} has been deleted from order #{order.first.name.capitalize}")
    else
      client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
    end
   end
 end

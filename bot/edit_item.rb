class EditItem < SlackRubyBot::Commands::Base
   command 'edit from order' do |client, data, match|
     #edit from order 1, 1, date, next thursday 5:00
    order_details = match['expression'].split(", ")
    order_num = order_details[0]
    item_num = order_details[1].to_i
    order_attr = order_details[2]
      if order_attr == "item" then order_attr = "name" end
    order_change = order_details[3]
    order = Order.order_by_channel(data.channel).where(id: order_num)
    if order != []
      order.first.items[item_num - 1].assign_attributes("#{order_attr}": order_change)
      if order.first.items[item_num - 1].save
        client.say(channel: data.channel, text: "Item #{item_num}'s #{order_attr} has been change to #{order_change}")
      else
        client.say(channel: data.channel, text: "Sorry, your attribue name is incorrect. Please choose one of the following: owner, item, or notes")
      end
    else
      client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
    end
   end
 end

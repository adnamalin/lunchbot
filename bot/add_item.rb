# add to 1, Amanda, Chicken torta, extra cheese please!

class AddItem < SlackRubyBot::Commands::Base
   command 'add to order' do |client, data, match|
    order_details = match['expression'].split(", ")
    order_num = order_details[0]
    order_username = order_details[1]
    order_name = order_details[2]
    order_notes = order_details[3]
    order = Order.where(id: order_num)
    if order != []
      item = order.first.items.build(name: order_name, username: order_username, notes: order_notes, owner: data.user)
      if item.save
        client.say(channel: data.channel, text: "#{order_username} has added her item to #{order.first.name}")
      else
        #add validations: item name, username
        client.say(channel: data.channel, text: "Sorry, I couln't save that order. Check your commands")
      end
    else
      client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
    end
   end
 end

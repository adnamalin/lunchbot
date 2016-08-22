class EditOrder < SlackRubyBot::Commands::Base
   command 'edit order' do |client, data, match|
     #edit order 1, date, next thursday 5:00
     #need better way to split, user has to write it in very specific way
      order_details = match['expression'].split(", ")
      order = Order.order_by_channel(data.channel).where(id: order_num)
      # TODO: make adjustment for if their changing date
      # TODO: make adjustments for link to clean up < >
      if order != []
        order.update("#{order_attr}": order_change)
        client.say(channel: data.channel, text: "I have updated order #{order_num}'s #{order_attr} to #{order_change}")
      else
        client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
      end
   end
 end

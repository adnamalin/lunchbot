require_relative 'order_finder'

class DeleteOrder < SlackRubyBot::Commands::Base
  include OrderFinder

   command 'delete order' do |client, data, match|
      order = Order.order_by_channel(data.channel).where(id: match['expression'])
      if order != []
        order.first.delete
        client.say(channel: data.channel, text: "Order #{order.first.id} has been deleted")
      else
        client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
      end
   end
 end

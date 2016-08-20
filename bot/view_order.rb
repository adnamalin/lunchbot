class ViewOrder < SlackRubyBot::Commands::Base
   command 'view order' do |client, data, match|
    order = Order.first.name
    client.say(channel: data.channel, text: order)
   end
 end

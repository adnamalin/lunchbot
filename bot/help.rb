class Help < SlackRubyBot::Commands::Base
   command 'help' do |client, data, match|
      options = "*Here are some commands you can tell me:*  \n view all - list of all orders in this channel \n view <order number> - list order details and items \n create order <name>, <date of lunch>, <restaurant> \n add to <order name>, <your name>, <item>, <notes>"
      client.say(channel: data.channel, text: options)
   end
 end

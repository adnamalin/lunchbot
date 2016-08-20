class Help < SlackRubyBot::Commands::Base
   command 'help' do |client, data, match|
      options = "Here are some commands you can tell me:  \n view all \n view <order number> \n create order <name>, <date of lunch>, <restaurant> \n add to <order name>, <your name>, <item>, <notes>"
      result =
      client.say(channel: data.channel, text: options)
   end
 end

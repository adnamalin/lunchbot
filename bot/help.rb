class Help < SlackRubyBot::Commands::Base
   command 'help' do |client, data, match|
      options = "Here are some commands you can tell me: \n create order <name>, <date of lunch>, <restaurant> \n add to <order name>, <your name>, <item>, <notes> \n view <order name>"
      result =
      client.say(channel: data.channel, text: options)
   end
 end

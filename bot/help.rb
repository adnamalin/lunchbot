class Help < SlackRubyBot::Commands::Base
   command 'help' do |client, data, match|
      options = "*Here are some commands you can tell me:*  \n *view all* - list of all orders in this channel \n *view <order number>* - list order details and items \n \n _Order and Item Creation are seperated by commas_ \n *create order <name>, <date of lunch>, <restaurant>, <menu link>* - create order mentor lunch, this tuesday 5:00, Xoco, http://www.rickbayless.com/wp-content/uploads/bsk-pdf-manager/241_XRN_8.5X14_V2_SWEET_SUMMER,_SWEET_CORN_080316.PDF \n *add to <order number>, <your name>, <item>, <notes>* - add to 1, Amanda, Chicken torta, extra cheese please!"
      client.say(channel: data.channel, text: options)
   end
 end

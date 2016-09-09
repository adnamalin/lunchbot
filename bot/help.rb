class Help < SlackRubyBot::Commands::Base
   command 'help' do |client, data, match|
      options = " *LuncherBot* - This bot compiles and keeps track of your channels lunch orders. \n *Commands:*  \n \n *view all* - list of all orders in this channel \n *view <order number>* - list order details and items \n \n _Order and Item Creation are seperated by commas_ \n *create order <name>, <date>, <restaurant>, <menu link>* \n - create order mentor lunch, this tuesday 5:00, Xoco, http://ramensan.com/menu/ \n *edit order <order number>, <date, restaurant, menu, or name>, <new info>* \n edit order 1, date, next monday 12:00 \n *add to order <order number>, <your name>, <item>, <notes>* \n - add to order 1, Amanda, Chicken torta, extra cheese please! \n *delete from order <order number>, <item number >* \n - delete from order 1, 2  \n - *edit from order <order number>, <item number>, <owner, item, or notes>, <new info>* \n -edit from order 1, 2, notes, no cheese! "
      client.say(channel: data.channel, text: options)
   end
 end

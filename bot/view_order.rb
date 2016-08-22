class ViewOrder < SlackRubyBot::Commands::Base
   command 'view' do |client, data, match|
    #data: <Slack::Messages::Message channel="G2382L9AQ" team="T1CEKUERG" text="<@U236XH7L6> view all" ts="1471722466.000022" type="message" user="U1CE4LJ76">
    if match['expression'] == 'all'
      channel_orders = Order.order_by_channel(data.channel)
      if channel_orders != []
        client.say(channel: data.channel, text: Order.print_all_orders(channel_orders))
      else
        client.say(channel: data.channel, text: "No orders have been created for this channel")
      end
    else
      # TODO: find better way to handle order not found
      order = Order.order_by_channel(data.channel).where(id: match['expression'])
      if order != []
        client.say(channel: data.channel, text: order.first.print_single_order)
      else
        client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
      end
    end
   end
 end

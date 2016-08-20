class ViewOrder < SlackRubyBot::Commands::Base
   command 'view' do |client, data, match|
    #data: <Slack::Messages::Message channel="G2382L9AQ" team="T1CEKUERG" text="<@U236XH7L6> view all" ts="1471722466.000022" type="message" user="U1CE4LJ76">
    if match['expression'] == 'all'
      order = Order.print_all_orders(data.channel)
      client.say(channel: data.channel, text: order)
    else
      order = Order.find(match['expression']).print_single_order
      client.say(channel: data.channel, text: order)
    end
   end
 end

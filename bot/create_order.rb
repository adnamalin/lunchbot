class CreateOrder < SlackRubyBot::Commands::Base
   command 'create order' do |client, data, match|
    #data: <Slack::Messages::Message channel="G2382L9AQ" team="T1CEKUERG" text="<@U236XH7L6> view all" ts="1471722466.000022" type="message" user="U1CE4LJ76">
    order_details = match['expression'].split(",")
    #Slack sends it over with < > wrapping the link, cleaning it up
    menu_cleaned = order_details[3].gsub!(/[<>]/, '')
    #adjust chronic for timezones
    Time.zone = "UTC"
    Chronic.time_class = Time.zone
    date_cleaned = Chronic.parse(order_details[1])
    #create order new so I can handle errors later on save 
    order = Order.new(name: order_details[0], lunch_date: date_cleaned, restaurant: order_details[2], menu: menu_cleaned, channel: data.channel, owner: data.user)
    if order.save
      client.say(channel: data.channel, text: order.print_single_order)
    else
      client.say(channel: data.channel, text: "Sorry, I couln't save that order. Check your command.s")
    end
   end
 end

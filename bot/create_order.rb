class CreateOrder < SlackRubyBot::Commands::Base
   command 'create order' do |client, data, match|
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
      #add validations: name, lunch date, restaurant, menu is link if provided
      client.say(channel: data.channel, text: "Sorry, I couln't save that order. Check your commands")
    end
   end
 end

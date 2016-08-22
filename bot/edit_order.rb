class EditOrder < SlackRubyBot::Commands::Base
   command 'edit order' do |client, data, match|
     #edit order 1, date, next thursday 5:00
      order_details = match['expression'].split(", ")
      order_num = order_details[0]
      order_attr = order_details[1]
      order_change = order_details[2]
      order = Order.order_by_channel(data.channel).where(id: order_num)
      if order != []
        case order_attr
          when "date"
            Time.zone = "UTC"
            Chronic.time_class = Time.zone
            date_cleaned = Chronic.parse(order_change)
            order.update("lunch_date": date_cleaned)
          when "menu"
            link_cleaned = order_change.gsub!(/[<>]/, '')
            order.update("#{order_attr}": link_cleaned)
          else
            order.update("#{order_attr}": order_change)
        end
        client.say(channel: data.channel, text: "I have updated order #{order_num}'s #{order_attr} to #{order_change}")
      else
        client.say(channel: data.channel, text: "Sorry, I could not find that order in this channel.")
      end
   end
 end

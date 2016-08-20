class ChannelJoin < SlackRubyBot::Server

  on :channel_joined  do |client, data|
    client.say(channel: data.channel['id'], text: "Hi! I'm Lunchbot, thanks for adding me to #{data.channel['name']}!")
  end

  on :group_joined do |client, data|
    client.say(channel: data.channel['id'], text: "Hi! I'm Lunchbot, thanks for adding me to #{data.channel['name']}!")
  end
end

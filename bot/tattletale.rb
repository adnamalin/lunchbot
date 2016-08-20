$:.unshift File.dirname(__FILE__)
 require 'help'
 require 'channel_join'

 Thread.abort_on_exception = true

 Thread.new do
   SlackRubyBot::App.instance.run
 end

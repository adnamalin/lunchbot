$:.unshift File.dirname(__FILE__)
 require 'help'
 require 'channel_join'
require 'view_order'
require 'create_order'
require 'delete_order'

 Thread.abort_on_exception = true

 Thread.new do
   SlackRubyBot::App.instance.run
 end

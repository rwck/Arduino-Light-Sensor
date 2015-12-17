require 'rubygems'
require 'bundler/setup'
require 'puma'
require 'faye'
require 'faye/websocket'
require 'logger'

require_relative 'sinatra_sockets'

Faye::WebSocket.load_adapter('puma')

use Faye::RackAdapter, :mount => '/faye', :timeout => 100

run MyChat::SinatraApp

require 'rubygems'
require 'bundler/setup'
require 'puma'
require 'faye'
require 'faye/websocket'
require 'logger'

require_relative 'sinatra_sockets'

Faye::WebSocket.load_adapter('puma')

# Set up the channels for the websockets
use Faye::RackAdapter, :mount => '/faye', :timeout => 100
use Faye::RackAdapter, :mount => '/boo', :timeout => 100

# Launch the Sinatra app
run MyChat::SinatraApp

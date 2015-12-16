require 'faye/websocket'
require 'arduino_firmata'
require 'eventmachine'
require 'json'

def arduino_read_light
  arduino = ArduinoFirmata.connect
  # arduino.pin_mode 8, ArduinoFirmata::INPUT
  light_level = arduino.analog_read 0
end

def arduino_read_temp
  arduino = ArduinoFirmata.connect
  temp_level = arduino.analog_read 1
end


# ws = Faye::WebSocket::Client.new('ws://localhost:9292/faye')

ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.cocom')

#

p 'sending'
ws.send({ data: { light: arduino_read_light, temp: arduino_read_temp }, channel: '/arduino' }.to_json)

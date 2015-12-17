require 'faye/websocket'
require 'arduino_firmata'
require 'eventmachine'
require 'json'

class Arduino

  def light
    arduino.analog_read 0
  end

  def temp
    arduino.analog_read 1
  end

  def led_strobe
    2.times do
      arduino.digital_write 13, true
      sleep 0.2
      arduino.digital_write 13, false
      sleep 0.2
    end
  end

  private

  def arduino
    @arduino ||= ArduinoFirmata.connect
  end

end

EM.run do
  ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.com/faye')

  arduino = Arduino.new

  EM.add_periodic_timer(0.25) do
    if ws
      p 'sending'
      arduino.led_strobe

      ws.send({ data: { light: arduino.light, temp: arduino.temp }, channel: '/arduino' }.to_json)
    else p 'no socket present'
    end

  end
end

# EM.run do
#   ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.com/faye')
#
#   # ws.on :open do |_event|
#   #   p [:open]
#   #   puts 'Message from client: Socket opened'
#   #   # ws.send({ligh}.to_json)
#   # end
#   #
#   # ws.on :message do |event|
#   #   puts 'Message from client: Message received'
#   #   p [:message, event.data]
#   # end
#   #
#   # ws.on :error do |event|
#   #   puts 'Error'
#   #   p [:error, event]
#   # end
#   #
#   # ws.on :close do |event|
#   #   p [:close, event.code, event.reason]
#   #   puts 'Message from client: the socket has closed'
#   #   ws = nil
#   # end
#
#   EM.add_periodic_timer(0.5) do
#     if ws
#       p 'sending'
#
#       ws.send({ data: { light: arduino_read_light, temp: arduino_read_temp }, channel: '/arduino' }.to_json)
#       end
#   end
# end

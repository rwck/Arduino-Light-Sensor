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

  def led_on
    arduino.digital_write 13, true
  end

  def led_off
    arduino.digital_write 13, false
  end


  private

  def arduino
    @arduino ||= ArduinoFirmata.connect
  end

end

EM.run do
  ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.com/faye')

  arduino = Arduino.new

  ws.on :message do |event|
    p (event.data)
  end

  EM.add_periodic_timer(0.25) do
    if ws
      p 'sending'
      ws.send({ data: { light: arduino.light, temp: arduino.temp }, channel: '/arduino' }.to_json)

    else p 'no socket present'
    end
  end
end

require 'faye/websocket'
require 'serialport'
require 'eventmachine'
require 'json'

# params for serial port
port_str = "/dev/cu.usbmodem1411"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
sleep(5)
while true do
  puts sp.gets
  while (i = sp.gets) do
    # puts i
    puts sp
  end
end
sp.close


#
# def arduino_read_light
#   arduino = ArduinoFirmata.connect
#   # arduino.pin_mode 8, ArduinoFirmata::INPUT
#   light_level = arduino.analog_read 0
# end
#
# def arduino_read_temp
#   arduino = ArduinoFirmata.connect
#   temp_level = arduino.analog_read 1
# end
#
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

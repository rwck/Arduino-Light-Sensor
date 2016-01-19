require 'serialport'
require 'faye/websocket'
require 'eventmachine'
require 'json'
require 'pp'
require 'faye'

class Arduino
  def get_message
    arduino.write('l')
    message = arduino.gets.chomp
    # puts message
    if /\w*reading:\s*\d*/.match(message)
      reading = message.gsub(/\D/, '')
      puts message
      puts (reading.to_i * 20)
    else puts "There's something wrong with your regex"
    end
  end

  def light
    # message = ''
    # arduino.write('l')
    message = arduino.gets.chomp
    if /\w*reading:\s*\d*/.match(message)
      reading = message.gsub(/\D/, '')
      return reading.to_i
    end
  end

  def write(value)
    arduino.write(value)
  end

  def temp
  end

  def light_on
  end

  def light_off
  end

  private

  def arduino
    @parity = SerialPort::NONE
    @port_str = '/dev/cu.usbmodem1411'
    @baud_rate = 9600
    @data_bits = 8
    @stop_bits = 1

    @arduino ||= SerialPort.new(@port_str, @baud_rate, @data_bits, @stop_bits, @parity)
    @arduino

  end
end

EM.run do

  arduino = Arduino.new

  ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.com/faye')

  listening = Faye::Client.new('http://shrouded-cliffs-5129.herokuapp.com/faye')

  listening.subscribe('/boo') do |message|
    puts message.inspect['text']
    if message['text'] == "Hi there from the browser"
        puts "Yaroooooooo"
        arduino.write('t')
    end
  end

  EM.add_periodic_timer(0.2) do
    if ws
      pp 'sending'
      ws.send({ data: { light: arduino.light }, channel: '/arduino' }.to_json)
    else p 'no socket present'
    end
  end


  #
  # listening.subscribe('/boo') do |message|
  #   # mymessage = JSON.parse(message)
  #   puts message['text']
  #
  #   # puts mymessage['text']
  # end

  # puts ws
  # puts listening

  # listening.subscribe('/boo') do |message|
  #   puts message.inspect
  # end


  # ws.on :message do |event|
  #   # pp :message
  #   pp event.data
  #   # pp [:message, event]
  #   # ws.send(event.data)
  # end

  ws.on :message do |event|
    pp 'receiving'
    pp event.data
  end


end

# sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
#
# modem_parameters = sp.get_modem_params
# signals = sp.get_signals
# timeout = sp.read_timeout
# my_stop_bits = sp.stop_bits
# timeout = sp.read_timeout
#
# puts sp
# puts modem_parameters
# puts signals
# puts timeout
# puts my_stop_bits

# loop do
#   while (i = sp.gets.chomp)
#     puts i
#     sleep(1.0 / 100)
#     sp.write('l')
#   end
# end

# loop do
#   sp.write("Hello\n")
#   sleep(0.5)
# end

# input = sp.readline(5500)
# puts input

# sp.close

#
# EM.run do
#   ws = Faye::WebSocket::Client.new('ws://shrouded-cliffs-5129.herokuapp.com/faye')
#
#   arduino = Arduino.new
#
#   EM.add_periodic_timer(0.2) do
#     # arduino.get_message
#     if ws
#       p 'sending'
#       ws.send({ data: { light: arduino.light }, channel: '/arduino' }.to_json)
#     else p 'no socket present'
#     end
#   end
# end

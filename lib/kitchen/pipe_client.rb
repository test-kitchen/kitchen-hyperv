require 'win32/pipe'
require 'json'
require 'pry'

include Win32

Thread.new { loop { sleep 0.01 } } # Allow Ctrl-C

puts "VERSION: " + Pipe::VERSION

pclient = Pipe::Client.new('Commands')
puts "Connected..."

pclient.write("get-process chrome\n")
 
output = ''
loop do
  data = pclient.read  
  break if data == "DONE\r\n"
  output << data
end 

pclient.close

result = JSON.parse(output)
binding.pry



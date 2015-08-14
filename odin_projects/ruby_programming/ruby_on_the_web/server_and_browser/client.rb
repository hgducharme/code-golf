require 'socket'      # Sockets are in standard library
require 'net/http'

hostname = 'localhost'
path = '/index.html'
port = 2000

s = TCPSocket.open(hostname, port)

request = "GET #{path} HTTP/1.0"
s.print(request)

while line = s.gets   # Read lines from the socket
  puts line.chop      # And print with platform line terminator
end
s.close          
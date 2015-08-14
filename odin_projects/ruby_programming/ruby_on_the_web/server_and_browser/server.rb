require 'socket'
require 'net/http'

server = TCPServer.open(2000)
loop do
  client = server.accept
  
  begin
    request = client.gets.split(" ")
  
    if request[0]=="GET"
      
      begin
        file_to_read = File.open(request[1][1..-1])
        client.puts "#{request[2]} 200 OK"
        client.puts "Date: #{Time.now.ctime}"
        client.puts "Content-Length: #{file_to_read.size}"
        file_to_read.each { |line| client.puts line }
      rescue
        client.puts "#{request[2]} 404 File Not Found"
      end
    end
  end
end
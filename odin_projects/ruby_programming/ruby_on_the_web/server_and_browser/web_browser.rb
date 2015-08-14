require 'net/http'
host = 'www.myfitnesspal.com'
path = '/'

http = Net::HTTP.new(host)
headers, body = http.get(path)
if headers.code == '200'
  puts body
  puts "This is running"
else
  puts "#{headers.code} #{headers.message}"
  puts "Whoops, error!"
end

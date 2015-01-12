require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,'0')[0..4]
end

def list_legislators(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  
  legislator_names = legislators.collect do |legislator| 
    "#{legislator.first_name} #{legislator.last_name}"
  end

  legislator_names.join(", ")
end

puts "EventManager initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode} #{list_legislators(zipcode)}"
end
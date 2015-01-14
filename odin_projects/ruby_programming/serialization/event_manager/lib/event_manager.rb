require 'csv'
require 'sunlight'
require 'erb'

Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# Make sure each zipcode from attendees is valid
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

# Makre sure each phone number from attendees is valid
def clean_phone_number(phone_number)
  new_number = phone_number.to_s.gsub(/[^0-9]/, '')
  length = new_number.length

  if length == 10
    clean_number = new_number
  elsif length == 11 && new_number[0] == '1'
    new_number = new_number.split('')
    new_number.shift
    clean_number = new_number.join('')
  else
    false
  end

  clean_number

end

# Find legislators for attendee's zipcode
def legislators_by_zipcode(zipcode)
  Sunlight::Legislator.all_in_zipcode(zipcode)
end

# Save thank you letters in directory
def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

# The contents of event_attendees file
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# Template letter is the contents of form_letter
# Make template_letter a new instance of ERB class
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  # Attributes of attendee
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone])
  puts name
  puts phone_number

  # Find legislators for attendee's zipcode
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  # Send binding to form_letter.erb
  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

puts "EventManager completed."
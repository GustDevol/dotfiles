#!/usr/bin/ruby

require 'net/http'
require 'json'

APIKEY="a5726f84bd2d1c4b4a97bc856dd86cb5"
url = "https://api.openweathermap.org/data/2.5/weather?q=Asansol&appid=#{APIKEY}"
uri = URI url

begin
  response = Net::HTTP.get uri
rescue SocketError => _
  puts "  "
  puts ""
  puts '#FF0000'
  exit 0
end

result = JSON.parse response
weather = ""

temperature = result["main"]["temp"].to_f - 273.15
temp_unit =  "°C"
if ARGV.include? "-f"
  temperature = (temperature * 1.8) + 32
  temp_unit = "°F"
end
wind_speed = result["wind"]["speed"].to_f * 3.6

if ARGV.include? "--nerd"
  weather += "" + temperature.to_i.to_s + temp_unit
  weather += " 煮" + wind_speed.to_i.to_s + "km/h"
else
  weather += "🌡️" + temperature.to_i.to_s + temp_unit
  weather += " 🍃" + wind_speed.to_i.to_s + "km/h"
end

puts weather
puts ""
puts '#1FF9FF'

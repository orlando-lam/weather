# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.

# Solution
# https://entr451.com/practice-weather-solution/

# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...

# STEPS
# Look at the weather_data hash.
# Find the current data.
# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"
# Find the array of forecast data.
# Read only the first element of that array to display the conditions for the rest of today.
# Use a loop to display the daily summary for the upcoming forecast.

# 1. inspect the weather_data hash
# puts weather_data

region = weather_data["region"]
current_temp = weather_data["currentConditions"]["temp"]["f"]
current_condition = weather_data["currentConditions"]["comment"]

puts "In #{region} it is currently #{current_temp} degrees and #{current_condition.downcase}"

todays_forecast = weather_data["next_days"][0]
# puts todays_forecast
puts "The rest of today will be a high of #{todays_forecast["max_temp"]["f"]} degrees and #{todays_forecast["comment"].downcase}"

puts "\nThe next days forecast is:"
for daily_forecast_data in weather_data["next_days"]
    day_of_week = daily_forecast_data["day"]
    high_temp = daily_forecast_data["max_temp"]["f"]
    conditions = daily_forecast_data["comment"].downcase
    puts "#{day_of_week}: a high of #{high_temp} and #{conditions}."
end

# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.
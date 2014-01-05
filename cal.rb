require_relative "lib/month"
require_relative "lib/year"
require_relative "lib/zeller"

months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
week_days = "Su Mo Tu We Th Fr Sa"

month = ARGV[0].to_i
year = ARGV[1].to_i
if year < 1800 || year > 3000
  puts "year out of range"
  exit 64
end

cal = Month.new(month, year)
month_name = months[(month-1)]
puts "#{month_name} #{year}".center(20)
puts week_days

(1..6).each do |num|
  puts cal.calendar_row(num).join(' ')
end

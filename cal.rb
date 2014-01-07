require_relative "lib/month"
require_relative "lib/year"
require_relative "lib/zeller"

months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
week_days = "Su Mo Tu We Th Fr Sa"

if ARGV.length == 2
  # Just print one month
  month = ARGV[0].to_i
  year = ARGV[1].to_i

  # Only accept years between 1800 and 3000
  if year < 1800 || year > 3000
    puts "year out of range"
    exit 64
  end
  # test valid input for month
  unless month >= 1 && month <=12
    puts "invalid input for month"
    exit 64
  end

  cal = Month.new(month, year)
  month_name = months[(month-1)]
  puts "#{month_name} #{year}".center(20)
  puts week_days

  (1..6).each do |num|
    puts cal.calendar_row(num).join(' ')
  end

elsif ARGV.length == 1
  # Print a whole year
  year = ARGV[0].to_i
  # Only accept years between 1800 and 3000
  if year < 1800 || year > 3000
    puts "year out of range"
    exit 64
  end
  cal = Year.new(year)
  month = 1
  row = 1

  # Year
  puts "#{year}".center(60)

  while month < 13
    # Month Heading
    month_name_row = ""
    3.times do
      month_name = months[(month-1)]
      month_name_row.concat("#{month_name}".center(20))
      month_name_row.concat("  ")
      month += 1
    end
    puts month_name_row

    # Weekday Heading
    week_days_row = "#{week_days}  #{week_days}  #{week_days}"
    puts week_days_row

    # Dates
    6.times do
      puts cal.calendar_row(row).join(' ')
      row += 1
    end

    # To put extra space between rows of months but not at the end
    if month < 13
      puts ""
    end
  end

end


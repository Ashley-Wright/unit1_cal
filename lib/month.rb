
class Month
  MONTHS = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  WEEK_DAYS = "Su Mo Tu We Th Fr Sa\n"

  def initialize month, year
    @month = month
    @year = year
  end

  def first_day
    Zellers_congruence.calculate(@month, @year)
  end

  def number_of_days
    months_31days = [1, 3, 5, 7, 8, 10, 12]
    months_30days = [4, 6, 9, 11]

    if months_31days.include?(@month)
      days = 31
    elsif months_30days.include?(@month)
      days = 30
    elsif @month == 2
      year = Year.new(@year)
      days = year.leap_year? ? 29 : 28
    end
  end

  def calendar_rows
    first_day = self.first_day
    calendar_days = []

    # Correct spacing before first day
    spaces = first_day == 0 ? 6 : first_day - 1
    spaces.times {calendar_days.push('  ')}

    # Calendar days
    days = self.number_of_days
    (1..days).to_a.each do |day|
      if day < 10
        day = " " + day.to_s
      end
      calendar_days.push(day.to_s)
    end

    # In order to make 6 full rows
    until calendar_days.length == 42 do
      calendar_days.push('  ')
    end

    return calendar_days
  end

  def calendar_row index
    start = (index - 1) * 7
    self.calendar_rows[start..(start + 6)]
  end

  def to_s
    month_name = MONTHS[(@month-1)]
    string = "#{month_name} #{@year}".center(20)
    string.concat("\n" + WEEK_DAYS)

    (1..6).each do |num|
      string << calendar_row(num).join(' ') + "\n"
    end
    string
  end

end
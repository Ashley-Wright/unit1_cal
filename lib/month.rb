
class Month
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

end

class Year
  def initialize year
    @year = year
  end

  def leap_year?
    if @year % 400 == 0
      true
    elsif @year % 100 == 0
      false
    elsif @year % 4 == 0
      true
    else
      false
    end
  end

  def calendar_row index
    row = []
    for i in (1..3)
      month = Month.new(i, @year)
      row.push(month.calendar_row(index))
      row.push(" ")
    end
    return row.flatten
  end

end
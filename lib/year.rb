
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
    if index >= 1 && index <= 6
      for i in (1..3)
        month = Month.new(i, @year)
        row.push(month.calendar_row(index))
        row.push("") # Add an extra empty string after each month for spacing
      end
    elsif index >= 7 && index <= 12
      for i in (4..6)
        month = Month.new(i, @year)
        row.push(month.calendar_row(index - 6))
        row.push("") # Add an extra empty string after each month for spacing
      end
    elsif index >= 13 && index <= 18
      for i in (7..9)
        month = Month.new(i, @year)
        row.push(month.calendar_row(index - 12))
        row.push("") # Add an extra empty string after each month for spacing
      end
    elsif index >= 19 && index <= 24
      for i in (10..12)
        month = Month.new(i, @year)
        row.push(month.calendar_row(index - 18))
        row.push("") # Add an extra empty string after each month for spacing
      end
    end
    return row.flatten #Gets rid of arrays inside of arrays
  end

end
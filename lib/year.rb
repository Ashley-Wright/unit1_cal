
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
    quarters = {1 => (1..3),
                2 => (4..6),
                3 => (7..9),
                4 => (10..12)}

    quarter = (index/6.0).ceil
    row_within_quarter = index % 6

    row = []
    quarters[quarter].to_a.each do |month|
      current_month = Month.new(month, @year)
      row.push(current_month.calendar_row(row_within_quarter))
      row.push("") # Add an extra empty string after each month for spacing
    end
    return row.flatten #Gets rid of arrays inside of arrays
  end

end
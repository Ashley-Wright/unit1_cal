

class Month
  def initialize month, year
    @month = month
    @year = year
  end

  def first_day
    Zellers_congruence.calculate(@month, @year)
  end

end
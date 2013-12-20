
class Zellers_congruence
  def self.calculate month, year
    day_of_the_month = 1 #because we always want the first day of the month
    if month == 1 || month == 2
      month = month + 12
      year = year - 1
    end
    year_of_the_century = year % 100
    century = (year/100).floor

    day = day_of_the_month + ((13*(month + 1))/5).floor + year_of_the_century + (year_of_the_century/4).floor + (century/4).floor - 2*century
    day = day % 7
  end
end
require "minitest/autorun"
require "year"

class TestYear < MiniTest::Unit::TestCase

  def test_01_Year_class_takes_one_argument
    year = Year.new(2012)
    assert_instance_of(Year, year)
  end

  def test_02_Year_class_leap_year
    year = Year.new(2012)
    assert_equal true, year.leap_year?
  end

  def test_03_Year_class_not_leap_year
    year = Year.new(2013)
    assert_equal false, year.leap_year?
  end
  # leap_year? goes through more testing in Month_number_of_days_february

  # def test_04_Year_class_calendar_row
  #   year = Year.new(2012)
  #   row = "15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17"
  #   assert_equal row, year.calendar_row[3]
  # end
end
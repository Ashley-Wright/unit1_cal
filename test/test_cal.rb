require "minitest/autorun"
require_relative "../cal"

class TestCal < MiniTest::Unit::TestCase

  def test_01_Zellers_class_takes_two_arguments
    assert_raises(ArgumentError) do
      test1 = Zellers_congruence.calculate(2012)
    end
    assert_nothing_raised(ArgumentError) do
      test2 = Zellers_congruence.calculate(5, 2012)
    end
  end

  def test_02a_Zellers_class_days
    assert_equal 1, Zellers_congruence.calculate(1, 2012)
  end

  def test_02b_Zellers_class_days
    assert_equal 0, Zellers_congruence.calculate(9, 2012)
  end

  def test_02c_Zellers_class_days
    assert_equal 6, Zellers_congruence.calculate(6, 2012)
  end

  def test_07_Month_class_first_day
    january = Month.new(1, 2012)
    september = Month.new(9, 2012)
    june = Month.new(6, 2012)

    assert_equal 1, january.first_day
    assert_equal 0, september.first_day
    assert_equal 6, june.first_day
  end

  def test_08_Month_class_number_of_days
    january = Month.new(1, 2012)
    april = Month.new(4, 2012)

    assert_equal 31, january.number_of_days
    assert_equal 30, april.number_of_days
  end

  def test_09_Month_class_number_of_days_febuary
    not_leap = Month.new(2, 2013)
    leap_divideby_4 = Month.new(2, 2012)
    not_leap_divideby_100 = Month.new(2, 1900)
    leap_divideby_400 = Month.new(2, 2000)


    assert_equal 28, not_leap.number_of_days
    assert_equal 29, leap_divideby_4.number_of_days
    assert_equal 28, leap_divideby_100.number_of_days
    assert_equal 29, leap_divideby_400.number_of_days
  end

  def test_X_Month_class_calendar_rows_starts_on_sunday
    january = Month.new(1, 2012)
    array = (1..31).to_a
    11.times do
      array.push(' ')
    end
    assert_equal array, january.calendar_rows
  end

  def test_X_Month_class_calendar_rows_starts_not_on_sunday
    march = Month.new(3, 2012)
    array = []
    4.times do
      array.push(' ')
    end
    array.push((1..31).to_a)
    7.times do
      array.push(' ')
    end
    assert_equal array, march.calendar_rows
  end

  def test_X_Month_class_calendar_row_first
    january = Month.new(1, 2012)
    assert_equal [1, 2, 3, 4, 5, 6, 7], january.calendar_row[1]
  end

  def test_X_Month_class_calendar_row_not_first
    january = Month.new(1, 2012)
    assert_equal [15, 16, 17, 18, 19, 20, 21], january.calendar_row[3]
  end

  def test_X_Year_class_takes_one_argument
    year = Year.new(2012)
    assert_instance_of(Year, year)
  end

  def test_X_Year_class_leap_year
    year = Year.new(2012)
    assert_equal true, year.leap_year?
  end

  def test_X_Year_class_not_leap_year
    year = Year.new(2013)
    assert_equal false, year.leap_year?
  end

  def test_X_Year_class_calendar_row
    year = Year.new(2012)
    row = "15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17"
    assert_equal row, year.calendar_row[3]
  end


  # Integration Testing

  def test_10_print_month_starts_on_sunday
    shell_output = `ruby cal.rb 1 2012`
    expected_output = `cal 1 2012`

    assert_equal expected_output, shell_output
  end

  def test_11_print_month_leap_year
    shell_output = `ruby cal.rb 2 2012`
    expected_output = `cal 2 2012`

    assert_equal expected_output, shell_output
  end

  def test_12_print_month_six_lines
    shell_output = `ruby cal.rb 9 2012`
    expected_output = `cal 9 2012`

    assert_equal expected_output, shell_output
  end

  def test_13_print_month_four_lines
    shell_output = `ruby cal.rb 2 2015`
    expected_output = `cal 2 2015`

    assert_equal expected_output, shell_output
  end

  def test_14_print_month_non_leap_year
    shell_output = `ruby cal.rb 2 1900`
    expected_output = `cal 2 1900`

    assert_equal expected_output, shell_output
  end

  def test_15_print_month_leap_year
    shell_output = `ruby cal.rb 2 2000`
    expected_output = `cal 2 2000`

    assert_equal expected_output, shell_output
  end

  def test_16_print_month_outside_of_scope
    shell_output = `ruby cal.rb 5 3005`

    assert_equal nil, shell_output
  end

  def test_17_print_year
    shell_output = `ruby cal.rb 2012`
    expected_output = `cal 2012`

    assert_equal expected_output, shell_output
  end

end
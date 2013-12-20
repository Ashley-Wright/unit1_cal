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

  def test_02_Zellers_class_days
    assert_equal 1, Zellers_congruence.calculate(1, 2012)
    assert_equal 0, Zellers_congruence.calculate(9, 2012)
    assert_equal 6, Zellers_congruence.calculate(6, 2012)
  end

  def test_03_Calendar_class_can_take_one_argument
    input = Calendar.new(2012)
    assert_instance_of(Calendar, input)
  end

  def test_04_Calendar_class_can_take_two_argument
    input = Calendar.new(1, 2012)
    assert_instance_of(Calendar, input)
  end

  def test_05_Calendar_class_year_method
    calendar = Calendar.new(1, 2012)
    assert_equal 2012, calendar.year
  end

  def test_06_Calendar_class_month_method
    calendar = Calendar.new(1, 2012)
    assert_equal 11, calender.month
  end

  def test_07_Month_class_first_day
    january = Month.new(1, 2012)
    september = Month.new(9, 2012)
    june = Month.new(6, 2012)

    assert_equal 1, january
    assert_equal 0, september
    assert_equal 6, june
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
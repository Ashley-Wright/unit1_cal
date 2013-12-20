# require "minitest/autorun"
# require "month"

# class TestMonth < MiniTest::Unit::TestCase

#   def test_01a_Month_class_first_day_sunday
#     january = Month.new(1, 2012)
#     assert_equal 1, january.first_day
#   end

#   def test_01b_Month_class_first_day_saturday
#     september = Month.new(9, 2012)
#     assert_equal 0, september.first_day
#   end

#   def test_01c_Month_class_first_day_friday
#     june = Month.new(6, 2012)
#     assert_equal 6, june.first_day
#   end

#   def test_02a_Month_class_number_of_days_long
#     january = Month.new(1, 2012)
#     assert_equal 31, january.number_of_days
#   end

#   def test_02b_Month_class_number_of_days_short
#     april = Month.new(4, 2012)
#     assert_equal 30, april.number_of_days
#   end

#   def test_03a_Month_class_number_of_days_febuary
#     not_leap = Month.new(2, 2013)
#     assert_equal 28, not_leap.number_of_days
#   end

#   def test_03b_Month_class_number_of_days_febuary
#     leap_divideby_4 = Month.new(2, 2012)
#     assert_equal 29, leap_divideby_4.number_of_days
#   end

#   def test_03c_Month_class_number_of_days_febuary
#     not_leap_divideby_100 = Month.new(2, 1900)
#     assert_equal 28, leap_divideby_100.number_of_days
#   end

#   def test_03d_Month_class_number_of_days_febuary
#     leap_divideby_400 = Month.new(2, 2000)
#     assert_equal 29, leap_divideby_400.number_of_days
#   end

#   def test_04_Month_class_calendar_rows_starts_on_sunday
#     january = Month.new(1, 2012)
#     array = (1..31).to_a
#     11.times do
#       array.push(' ')
#     end
#     assert_equal array, january.calendar_rows
#   end

#   def test_05_Month_class_calendar_rows_starts_not_on_sunday
#     march = Month.new(3, 2012)
#     array = []
#     4.times do
#       array.push(' ')
#     end
#     array.push((1..31).to_a)
#     7.times do
#       array.push(' ')
#     end
#     assert_equal array, march.calendar_rows
#   end

#   def test_06_Month_class_calendar_row_first
#     january = Month.new(1, 2012)
#     assert_equal [1, 2, 3, 4, 5, 6, 7], january.calendar_row[1]
#   end

#   def test_07_Month_class_calendar_row_not_first
#     january = Month.new(1, 2012)
#     assert_equal [15, 16, 17, 18, 19, 20, 21], january.calendar_row[3]
#   end
# end
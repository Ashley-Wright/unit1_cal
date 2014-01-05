require "minitest/autorun"

def ignore_trailing_whitespace lines
  output = ""
  lines.each_line do |line|
    output.concat(line.rstrip + "\n")
  end
  return output
end

class TestIntegration < MiniTest::Unit::TestCase

  def test_10_print_month_starts_on_sunday
    shell_output = ignore_trailing_whitespace `ruby cal.rb 1 2012`
    expected_output = ignore_trailing_whitespace `cal 1 2012`
    assert_equal expected_output, shell_output
  end

  def test_11_print_month_leap_year
    shell_output = ignore_trailing_whitespace `ruby cal.rb 2 2012`
    expected_output = ignore_trailing_whitespace `cal 2 2012`

    assert_equal expected_output, shell_output
  end

  def test_12_print_month_six_lines
    shell_output = ignore_trailing_whitespace `ruby cal.rb 9 2012`
    expected_output = ignore_trailing_whitespace `cal 9 2012`

    assert_equal expected_output, shell_output
  end

  def test_13_print_month_four_lines
    shell_output = ignore_trailing_whitespace `ruby cal.rb 2 2015`
    expected_output = ignore_trailing_whitespace `cal 2 2015`

    assert_equal expected_output, shell_output
  end

  def test_14_print_month_non_leap_year
    shell_output =  ignore_trailing_whitespace `ruby cal.rb 2 1900`
    expected_output = ignore_trailing_whitespace `cal 2 1900`

    assert_equal expected_output, shell_output
  end

  def test_15_print_month_leap_year
    shell_output = ignore_trailing_whitespace `ruby cal.rb 2 2000`
    expected_output = ignore_trailing_whitespace `cal 2 2000`

    assert_equal expected_output, shell_output
  end

  def test_16_print_month_outside_of_scope
    shell_output = `ruby cal.rb 5 3005`

    assert_equal 64, $?.exitstatus
  end

  # def test_17_print_year
  #   shell_output = `ruby cal.rb 2012`
  #   expected_output = `cal 2012`

  #   assert_equal expected_output, shell_output
  # end
end
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test
  attr_reader :cc_1,
              :cc_2,
              :cc_3,
              :cc_4,
              :cc_5,
              :cc_6,
              :cc_amex1,
              :cc_amex2
  def setup
    @cc_1     = CreditCheck.new('5541808923795240')
    @cc_2     = CreditCheck.new('4024007136512380')
    @cc_3     = CreditCheck.new('6011797668867828')
    @cc_4     = CreditCheck.new('5541801923795240')
    @cc_5     = CreditCheck.new('4024007106512380')
    @cc_6     = CreditCheck.new('6011797668868728')
    @cc_amex1 = CreditCheck.new('342804633855673')
    @cc_amex2 = CreditCheck.new('342801633855673')
  end

  def test_it_exists
    assert_instance_of CreditCheck, cc_1
    assert_instance_of CreditCheck, cc_4
    assert_instance_of CreditCheck, cc_amex1
  end

  def test_it_has_a_number
    expected = '5541808923795240'
    actual = cc_1.cc_num

    assert_equal expected, actual
  end

  def test_it_can_have_a_different_number
    expected_1 = '4024007136512380'
    actual_1 = cc_2.cc_num

    expected_2 = '6011797668867828'
    actual_2 = cc_3.cc_num

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_it_turns_number_to_integer_then_reverses_and_returns_array
    expected = [0, 4, 2, 5, 9, 7, 3, 2, 9, 8, 0, 8, 1, 4, 5, 5]
    actual = cc_1.number_converter

    assert_equal expected, actual
  end

  def test_it_can_reverse_and_return_different_card_numbers
    expected_1 = [8, 2, 7, 8, 6, 8, 8, 6, 6, 7, 9, 7, 1, 1, 0, 6]
    actual_1 = cc_6.number_converter

    expected_2 = [3, 7, 6, 5, 5, 8, 3, 3, 6, 4, 0, 8, 2, 4, 3]
    actual_2 = cc_amex1.number_converter

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_it_doubles_every_other_digit
    expected = [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10]
    actual = cc_1.doubles_every_other

    assert_equal expected, actual
  end

  def test_it_can_map_and_double_different_card_numbers
    expected_1 = [3, 14, 6, 10, 5, 16, 3, 6, 6, 2, 0, 16, 2, 8, 3]
    actual_1 = cc_amex2.doubles_every_other

    expected_2 = [0, 8, 2, 10, 9, 14, 3, 4, 9, 2, 0, 16, 1, 8, 5, 10]
    actual_2 = cc_4.doubles_every_other

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_it_sums_the_digits_of_the_numbers_greater_than_nine
    expected = [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1]
    actual = cc_1.sums_double_digit_numbers

    assert_equal expected, actual
  end

  def test_it_can_sum_double_digit_numbers_of_different_cards
    expected_1 = [0, 7, 3, 4, 1, 1, 6, 6, 1, 5, 0, 0, 4, 4, 0, 8]
    actual_1 = cc_2.sums_double_digit_numbers

    expected_2 = [0, 7, 3, 4, 1, 1, 6, 0, 1, 5, 0, 0, 4, 4, 0, 8]
    actual_2 = cc_5.sums_double_digit_numbers

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_it_sums_all_digits
    expected = 70
    actual = cc_1.summed_digits

    assert_equal expected, actual
  end

  def test_it_can_sum_all_digits_of_different_cards
    expected_1 = 80
    actual_1 = cc_3.summed_digits

    expected_2 = 64
    actual_2 = cc_amex2.summed_digits

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_it_validates_card_number
    assert cc_1.valid?
  end

  def test_it_can_validate_different_card_numbers
    assert cc_2.valid?
    assert cc_3.valid?
    refute cc_4.valid?
    refute cc_5.valid?
    refute cc_6.valid?
    assert cc_amex1.valid?
    refute cc_amex2.valid?
  end

  def test_it_prints_a_validation_message
    expected = 'The number is valid'
    actual = cc_1.validate

    assert_equal expected, actual
  end

  def test_it_can_print_appropriate_validation_message
    expected_1 = 'The number is valid'
    actual_1 = cc_2.validate

    assert_equal expected_1, actual_1

    expected_2 = 'The number is valid'
    actual_2 = cc_3.validate

    assert_equal expected_2, actual_2

    expected_3 = 'The number is invalid'
    actual_3 = cc_4.validate

    assert_equal expected_3, actual_3

    expected_4 = 'The number is invalid'
    actual_4 = cc_5.validate

    assert_equal expected_4, actual_4

    expected_5 = 'The number is invalid'
    actual_5 = cc_6.validate

    assert_equal expected_5, actual_5

    expected_6 = 'The number is valid'
    actual_6 = cc_amex1.validate

    assert_equal expected_6, actual_6

    expected_7 = 'The number is invalid'
    actual_7 = cc_amex2.validate

    assert_equal expected_7, actual_7
  end
end

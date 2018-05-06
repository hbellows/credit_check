class CreditCheck
  attr_reader :cc_num

  def initialize(cc_num)
    @cc_num = cc_num
  end

  def number_converter
    cc_num.to_i.digits
  end

  def doubles_every_other
    number_converter.map.with_index do |num, index|
      if index.odd?
        num *= 2
      else
        num
      end
    end
  end

  def sums_double_digit_numbers
    doubles_every_other.map do |num|
      if num > 9
        num.digits.sum
      else
        num
      end
    end
  end

  def summed_digits
    sums_double_digit_numbers.sum
  end

  def valid?
    if summed_digits % 10 == 0
      true
    else
      false
    end
  end

  def validate
    if valid?
      'The number is valid'
    else
      'The number is invalid'
    end
  end
end

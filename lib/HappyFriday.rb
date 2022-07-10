# frozen_string_literal: true

require_relative "HappyFriday/version"
require 'active_support/all'
require 'holiday_jp'

module HappyFriday
  class Error < StandardError; end

  def happy_friday?
    self == self.get_next_happy_friday
  end

  def get_next_happy_friday
    last_of_month = self.end_of_month

    case last_of_month.wday
    when 0..4
      before_friday_days = last_of_month.wday + 2
    when 5..6
      before_friday_days = last_of_month.wday - 5
    else
      raise 'Unpredictable day of the week.'
    end

    last_friday = last_of_month - before_friday_days.days

    raise 'err' unless last_friday.wday == 5

    100.times do
      if HolidayJp.holiday?(last_friday)
        last_friday -= 1
      else
        break
      end
    end

    # If HappyFriday of that month has passed, get next month.
    if self > last_friday
      happy_friday = self.next_month.beginning_of_month.get_next_happy_friday
    else
      happy_friday = last_friday
    end

    happy_friday
  end
end

class Date
  include HappyFriday
end

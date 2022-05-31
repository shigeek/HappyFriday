# frozen_string_literal: true

require_relative "HappyFriday/version"
require 'active_support/all'
require 'holiday_jp'

module HappyFriday
  class Error < StandardError; end

  def self.happyfriday?(target_date)
    target_date.strftime("%Y%m%d") == HappyFriday.get_happy_friday(target_date).strftime("%Y%m%d")
  end

  def self.get_happy_friday(date)
    last_of_month = Date.new(date.year, date.month, -1)

    case last_of_month.wday
    when 0..4
      before_friday_days = last_of_month.wday + 2
    when 5..6
      before_friday_days = last_of_month.wday - 5
    else
      raise 'Unpredictable day of the week.'
    end

    last_friday = last_of_month.ago(before_friday_days.days)

    raise 'err' unless last_friday.wday == 5

    while
      unless HolidayJp.holiday?(last_friday)
        break
      end

      last_friday -= 1

      # Stop when you get to the previous month, just in case.
      if last_friday.month != last_of_month.month
        break
      end
    end

    last_friday
  end
end

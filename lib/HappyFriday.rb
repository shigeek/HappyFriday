# frozen_string_literal: true

require_relative "HappyFriday/version"
require 'active_support/all'
require 'holiday_jp'

module HappyFriday
  class Error < StandardError; end

  def self.happy_friday?(target_date)
    target_date.strftime("%Y%m%d") == HappyFriday.get_next_happy_friday(target_date).strftime("%Y%m%d")
  end

  def self.get_next_happy_friday(date)
    last_of_month = Date.new(date.year, date.month, -1)

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

    loop do
      if HolidayJp.holiday?(last_friday)
        last_friday -= 1
      else
        break
      end
    end

    last_friday
  end
end

# frozen_string_literal: true

require_relative "HappyFriday/version"
require 'active_support/all'
require 'holiday_jp'

module HappyFriday
  class Error < StandardError; end

  def self.happyfriday?(target_date)
    target_date == HappyFriday.get_happy_friday(target_date)
  end

  def self.get_happy_friday(date)
    last_of_month = Date.new(date.year, date.month, -1)

    case last_of_month.wday
    when 0..4
      before_friday_days = last_of_month.wday + 2
    when 5..6
      before_friday_days = last_of_month.wday - 5
    else
      raise 'ERR: Unpredictable day of the week.'
    end

    last_friday = last_of_month.ago(before_friday_days.days)

    while HolidayJp.holiday?(last_friday)
      last_friday = last_friday.ago(1.week)
    end

    if last_friday.month != last_of_month.month
      raise 'HappyFriday is no month!'
    end

    last_friday
  end
end

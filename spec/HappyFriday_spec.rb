# frozen_string_literal: true

RSpec.describe HappyFriday do
  it 'has a version number' do
    expect(HappyFriday::VERSION).not_to be nil
  end

  context 'Judge HappyFriday' do
    it 'If the last Friday of the month is a weekday' do
      date = Date.new(2022, 5, 27)
      expect(HappyFriday.happy_friday?(date)).to eq(true)
    end

    it 'If the last Friday of the month is a holiday' do
      date = Date.new(2022, 4, 29)
      expect(HappyFriday.happy_friday?(date)).to eq(false)
    end
  end

  context 'Get HappyFriday' do
    it 'If the last Friday of the month is a weekday' do
      target_date = Date.new(2022, 5, 1)
      predicted_date = Date.new(2022, 5, 27)
      expect(HappyFriday.get_next_happy_friday(target_date)).to eq(predicted_date)
    end

    it 'If the last Friday of the month is a holiday' do
      target_date = Date.new(2022, 4)
      predicted_date = Date.new(2022, 4, 28)
      expect(HappyFriday.get_next_happy_friday(target_date)).to eq(predicted_date)
    end

    it 'If HappyFriday of that month has passed' do
      target_date = Date.new(2022, 4, 30)
      predicted_date = Date.new(2022, 5, 27)
      expect(HappyFriday.get_next_happy_friday(target_date)).to eq(predicted_date)
    end
  end
end

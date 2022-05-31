# frozen_string_literal: true

RSpec.describe HappyFriday do
  it 'has a version number' do
    expect(HappyFriday::VERSION).not_to be nil
  end

  context 'judge HappyFriday' do
    it 'If the last Friday of the month is a weekday, return true' do
      date = Date.new(2022, 5, 27)
      expect(HappyFriday.happyfriday?(date)).to eq(true)
    end

    xit 'If the last Friday of the month is a holiday, return false' do
      date = Date.new(2022, 4, 29)
      expect(HappyFriday.happyfriday?(date)).to eq(false)
    end
  end

  context 'get HappyFriday' do
    it 'Normal month.' do
      target_date = Date.new(2022, 5)
      predicted_date = Date.new(2022, 5, 27).strftime("%Y%m%d")
      expect(HappyFriday.get_happy_friday(target_date).strftime("%Y%m%d")).to eq(predicted_date)
    end

    xit 'Months when the last Friday of the month is a holiday.' do
      target_date = Date.new(2022, 4)
      predicted_date = Date.new(2022, 4, 22)
      expect(HappyFriday.get_happy_friday(target_date)).to eq(predicted_date)
    end
  end
end

# frozen_string_literal: true

RSpec.describe HappyFriday do
  it "has a version number" do
    expect(HappyFriday::VERSION).not_to be nil
  end

  it 'If that day is HappyFriday' do
    date = Date.new(2022, 5, 27)
    expect(HappyFriday.happyfriday?(date)).to eq(true)
  end

  it 'If the last Friday of the month is a holiday, return false' do
    date = Date.new(2022, 4, 29)
    expect(HappyFriday.happyfriday?(date)).to eq(true)
  end

  it 'If the last Friday of the month is a holiday, get HappyFriday' do
    target_date = Date.new(2022, 4, 1)
    predicted_answer = Date.new(2022, 4, 22)
    expect(HappyFriday.get_happy_friday(date)).to eq(predicted_answer)
  end
end

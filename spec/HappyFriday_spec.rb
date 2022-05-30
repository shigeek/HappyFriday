# frozen_string_literal: true

RSpec.describe HappyFriday do
  it "yoyo" do
    date = Date.new(2022, 5, 27)
    expect(HappyFriday.happyfriday?(date)).to eq(true)
  end
end

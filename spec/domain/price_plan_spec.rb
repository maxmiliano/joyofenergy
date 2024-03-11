# frozen_string_literal: true

require 'rspec'
require 'date'
require_relative '../../lib/domain/price_plan'
require_relative '../../lib/domain/peak_time_multiplier'

describe PricePlan do
  let(:normal_date_time) { DateTime.new 2018, 1, 28, 0, 0, 0 }
  subject(:price_plan) { described_class.new nil, nil, 1.0, [peak_time_multiplier] }

  context 'when the date time is for a regular price' do
    let(:peak_time_multiplier) { PeakTimeMultiplier.new(3, 10.0) }  # multiply by 10 on Wednesdays

    it 'should return the base price' do
      expect(price_plan.price(normal_date_time)).to eq(1.0)
    end
  end
  context 'when the date time is an exceptional peak' do
    let(:peak_time_multiplier) { PeakTimeMultiplier.new(0, 10.0) }  # multiply by 10 on Sundays

    it 'should return exception price given exceptional date time' do
      expect(price_plan.price(normal_date_time)).to eq(10.0)
    end
  end
end

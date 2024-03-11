# frozen_string_literal: true

require_relative '../../lib/service/electricty_reading_service'
require 'rspec'

describe ElectricityReadingService do
  subject(:electricity_reading_service) { described_class.new }

  context "when requesting a meter that doesn't exist" do
    it "should return null when asked for a meter that doesn't exist" do
      expect(subject.get_readings('nonexistent-meter')).to be_nil
    end
  end

  context 'when meter exists and with empty readings' do
    before do
      subject.store_readings('meter-id', [])
    end

    it 'should return meter empty readings' do
      expect(subject.get_readings('meter-id')).to be_empty
    end
  end

  context 'when meter exists and with readings' do
    before do
      subject.store_readings('meter-id', ['reading 1'])
      subject.store_readings('meter-id', ['reading 2'])
    end

    it 'should store more meter readings against an existing meter' do
      expect(subject.get_readings('meter-id')).to eq ['reading 1', 'reading 2']
    end
  end
end

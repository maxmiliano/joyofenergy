# frozen_string_literal: true

require 'date'

class ElectricityReadingsGenerator
  ONE_SECOND = Rational(1, 24 * 60 * 60).freeze

  def generate(number)
    now = DateTime.now

    number.times.map do |n|
      {
        'time' => (now - (n * ONE_SECOND)).to_s,
        'reading' => rand(0.5..1.5)
      }
    end
  end
end

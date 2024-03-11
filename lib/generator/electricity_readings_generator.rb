# frozen_string_literal: true

require 'date'

class ElectricityReadingsGenerator
  def generate(number)
    now = DateTime.now
    one_second = Rational(1, 24 * 60 * 60)

    number.times.map do |n|
      {
        'time' => (now - (n * one_second)).to_s,
        'reading' => rand(0.5..1.5)
      }
    end
  end
end

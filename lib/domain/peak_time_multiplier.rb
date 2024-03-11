# frozen_string_literal: true

class PeakTimeMultiplier
  attr_reader :day_of_week, :multiplier

  def initialize(day_of_week, multiplier)
    @day_of_week = day_of_week
    @multiplier = multiplier
  end
end

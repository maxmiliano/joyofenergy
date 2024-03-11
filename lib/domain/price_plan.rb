# frozen_string_literal: true

require 'date'

class PricePlan
  attr_reader :plan_name, :base_cost

  def initialize(plan_name, energy_supplier, base_cost, peak_time_multipliers)
    @plan_name = plan_name
    @energy_supplier = energy_supplier
    @base_cost = base_cost
    @peak_time_multipliers = peak_time_multipliers
  end

  def price(date_time)
    multiplier = @peak_time_multipliers.find { |ptm| ptm.day_of_week == date_time.wday }&.multiplier || 1
    @base_cost * multiplier
  end
end

# frozen_string_literal: true

class ElectricityReadingService
  def initialize(readings_store = nil)
    @readings_store = readings_store || {}
  end

  def get_readings(meter_id)
    @readings_store[meter_id]
  end

  def store_readings(meter_id, readings)
    @readings_store[meter_id] ||= []
    @readings_store[meter_id].concat(readings)
  end
end

# frozen_string_literal: true

require 'sinatra/base'
require_relative '../service/electricty_reading_service'

# This class is the controller for the meter reading API.
# It is responsible for handling requests for reading and storing meter readings.
class MeterReadingController < Sinatra::Base
  def initialize(app = nil, electricity_reading_service)
    super(app)
    @electricity_reading_service = electricity_reading_service
  end

  before do
    if request.post? && request.body.length.positive?
      request.body.rewind
      @request_payload = JSON.parse request.body.read
    end
  end

  get '/readings/read/{meter_id}' do
    content_type :json
    @electricity_reading_service.get_readings(@params['meter_id']).to_json
  end

  post '/readings/store' do
    readings = @request_payload['electricityReadings']
    if readings&.length&.positive?
      meter_id = @request_payload['smartMeterId']
      @electricity_reading_service.store_readings(meter_id, readings)
      status 200
    else
      status 500
      { error: 'No valid readings supplied' }.to_json
    end
  end
end

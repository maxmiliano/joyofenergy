# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'pry'
require_relative 'controller/meter_reading_controller'
require_relative 'controller/price_plan_comparator_controller'
require_relative 'service/electricty_reading_service'
require_relative 'service/price_plan_service'
require_relative 'service/account_service'
require_relative 'configuration'

# This class is the entry point for the application. It sets up the routes and
# the services that are used by the controllers.
class JOIEnergy < Sinatra::Base
  extend Configuration

  electricity_reading_service = ElectricityReadingService.new(readings)
  price_plan_service = PricePlanService.new(price_plans, electricity_reading_service)
  account_service = AccountService.new smart_meter_to_price_plan_accounts

  use MeterReadingController, electricity_reading_service
  use PricePlanComparatorController, price_plan_service, account_service
end

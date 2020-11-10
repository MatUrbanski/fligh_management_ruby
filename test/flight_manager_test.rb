# frozen_string_literal: true

require 'test_helper'

class FlightManagerTest < Minitest::Test
  def setup
    @flight_manager = FlightManager.new
  end

  def test_create_a_new_flight
    added = @flight_manager.add_new_flight('LO1533', 'WAW', 'MUC')

    assert_equal(true, added)
  end

  def test_find_valid_connection
    @flight_manager.add_new_flight('LO1533', 'WAW', 'MUC')
    @flight_manager.add_new_flight('LH1232', 'JFK', 'PAR')
    @flight_manager.add_new_flight('YH1732', 'PAR', 'JFK')

    flights = @flight_manager.find_flights_between 'JFK', 'PAR', false

    assert_equal([
                   { flight_number: 'LH1232', origin: 'JFK', destination: 'PAR' },
                   { flight_number: 'YH1732', origin: 'PAR', destination: 'JFK' }
                 ], flights)
  end
end

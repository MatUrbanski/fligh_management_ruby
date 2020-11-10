# frozen_string_literal: true

# rubocop:disable Style/Documentation
class FlightManager
  def initialize
    @flight_storage = []
  end

  def add_new_flight(flight_number, origin, destination)
    existing_flight = find_existing_flight(flight_number, origin, destination)

    existing_flight ? false : add_flight_to_storage(flight_number, origin, destination)
  end

  def find_flights_between(origin, destination, direction_sensitive)
    @flight_storage.select do |fl|
      if direction_sensitive == true
        fl[:origin] == origin && fl[:destination] == destination
      else
        (fl[:origin] == origin || fl[:destination] == origin) && (fl[:destination] == destination || fl[:origin] == destination)
      end
    end
  end

  private

  def find_existing_flight(flight_number, origin, destination)
    @flight_storage.find do |fl|
      fl[:flight_number] == flight_number && fl[:origin] == origin && fl[:destination] == destination
    end
  end

  def add_flight_to_storage(flight_number, origin, destination)
    @flight_storage << { flight_number: flight_number, origin: origin, destination: destination }

    true
  end
end
# rubocop:enable Style/Documentation

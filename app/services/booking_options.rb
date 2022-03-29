# frozen_string_literal: true

class BookingOptions
  def initialize(params)
    @departure_airport = Airport.find_by(id: params[:departure_airport_id])
    @arrival_airport = Airport.find_by(id: params[:arrival_airport_id])
    @date = params["start_date"]
  end

  def find_flights
    direct_flights = find_flight_options(@departure_airport, @arrival_airport, @date).collect { |flight| [flight] }

  end

  private

    def find_connecting_flights
      first_leg_options = layover_codes.collect do |code|
        connecting_airport = Airport.where(name: code)
        find_flight_options(@departure_airport, connecting_airport, @date)
      end.flatten(1).uniq
      first_leg_options.map do |first_leg|
        find_second_leg_options(first_leg)
      end.compact
    end

    def find_second_leg_options(leg)
      flight_options = find_flight_options(leg.arrival_airport_airport, @arrival_airport, @date)
      layover_start = leg.departure_time + (leg.duration.to_f / 60).hours + 1.hour
      second_leg = find_flights_within_layover_time(flight_options, layover_start)
      return unless second_leg

      [leg, second_leg]
    end

    def find_flights_within_layover_time(options, layover_start)
      layover_end = layover_start + 2.hours
      connecting_flight = options.select do |flight|
        flight.departure_time.between?(layover_start, layover_end)
      end
      connecting_flight&.first
    end

    def find_flight_options(departure_airport, arrival_airport, date)
      Flight.where({ "departure_airport_id" => departure_airport,
                     "arrival_airport_id" => arrival_airport,
                     "start_date" => date })
    end

    # Airport ID's for Atlanta, Chicago, Dallas, and Denver
    def layover_codes
      %w[ATL ORD DFW DEN]
    end
end
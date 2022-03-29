# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |u| [u.name, u.id] }

    parsed_datetime = DateTime.parse(params[:start_date])
    @booking_options = Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id], start_date: (parsed_datetime)..(parsed_datetime + 1.day))
  end

  private

    def search_params
      params.require(:booking_options).permit(:departure_airport_id, :arrival_airport_id, :start_date)
    end
end

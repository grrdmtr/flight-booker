# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |u| [u.name, u.id] }

    @booking_options = Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id])
    # binding.pry
  end

  private

    def search_params
      params.require(:booking_options).permit(:departure_airport_id, :arrival_airport_id, :start_date)
    end
end

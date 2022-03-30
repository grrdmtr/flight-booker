# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    passenger_count = params[:passenger_count].to_i
    passenger_count.times { @booking.users.build }
  end

  def create
    binding.pry
    @booking = Booking.new(passenger_params)
    @flights = find_flights(params[:booking][:flight_id])

    if @booking.save
      flash[:notice] = "Please check your email for confirmation information!"
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    return if @booking

    flash[:alert] = "Sorry, this booking does not exist."
    redirect_to root_url
  end

  private

    def passenger_params
      params.require(:booking).permit(:flight_id, users_attributes: %i[id name lastname email])
    end

    def find_flights(booking_option)
      flight_numbers = booking_option.split
      flight_numbers.collect { |num| Flight.find_by(id: num) }
    end
end

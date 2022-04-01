class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport',
                                 foreign_key: :departure_airport_id,
                                 inverse_of: :departing_flights
  belongs_to :arrival_airport, class_name: 'Airport',
                               foreign_key: :arrival_airport_id,
                               inverse_of: :arriving_flights

  has_many :seats, dependent: :destroy
  has_many :bookings, through: :seats
  has_many :users, through: :bookings

  def details
    depart_time = humanize_departure
    arrive_time = humanize_arrival
    "#{depart_time} departure from #{departure_airport.name} and arrive at #{arrive_time} to #{arrival_airport.name}"
  end

  def humanize_departure
    departure_time.strftime('%l:%M %p')
  end

  def humanize_arrival
    (departure_time + (duration.to_f / 60).hours).strftime('%l:%M %p')
  end

  def humanize_date
    departure_date.strftime("%B %d, %Y")
  end
end

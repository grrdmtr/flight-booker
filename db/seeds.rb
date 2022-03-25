# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Airport.create(name: 'KIV')
  Airport.create(name: 'OTP')
  Airport.create(name: 'DUS')

  Flight.create([
                  { departure_airport_id: Airport.first.id, arrival_airport_id: Airport.last.id, duration: 320, start_date: '2022-12-25 07:00:00'},
                  { departure_airport_id: Airport.first.id, arrival_airport_id: Airport.last.id, duration: 320, start_date: '2022-12-25 09:00:00'},
                  { departure_airport_id: Airport.first.id, arrival_airport_id: Airport.last.id, duration: 320, start_date: '2022-12-25 11:00:00'},
                  { departure_airport_id: Airport.last.id, arrival_airport_id: Airport.first.id, duration: 380, start_date: '2022-12-26 07:00:00'},
                  { departure_airport_id: Airport.last.id, arrival_airport_id: Airport.first.id, duration: 380, start_date: '2022-12-26 09:00:00'},
                  { departure_airport_id: Airport.last.id, arrival_airport_id: Airport.first.id, duration: 380, start_date: '2022-12-26 11:00:00'}
                ])

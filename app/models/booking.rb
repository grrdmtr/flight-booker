class Booking < ApplicationRecord
  has_many :flights
  has_many :users

  accepts_nested_attributes_for :users
end

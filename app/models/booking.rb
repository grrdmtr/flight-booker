class Booking < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :seats, dependent: :destroy
  has_many :flights, through: :seats

  accepts_nested_attributes_for :users
end

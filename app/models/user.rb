class User < ApplicationRecord
  belongs_to :booking
  has_many :flights, through: :booking
end

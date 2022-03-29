class AddUserToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user
  end
end

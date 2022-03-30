class AddBookingIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :booking
  end
end

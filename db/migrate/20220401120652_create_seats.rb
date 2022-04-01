class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.integer :booking_id
      t.integer :flight_id

      t.timestamps
    end
  end
end

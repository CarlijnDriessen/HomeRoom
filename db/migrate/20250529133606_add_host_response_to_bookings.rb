class AddHostResponseToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :host_response, :text
  end
end

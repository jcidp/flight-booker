class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
  end

  def show
  end
end

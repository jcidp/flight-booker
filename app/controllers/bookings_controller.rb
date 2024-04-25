class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      send_confirmation_emails
      redirect_to @booking
    else
      @flight = @booking.flight
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

  def send_confirmation_emails
    @booking.passengers.each { |passenger| PassengerMailer.with(passenger: passenger, booking: @booking)
        .booking_confirmation_email.deliver_now }
  end
end

class PassengerMailer < ApplicationMailer
  def booking_confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    @flight = @booking.flight
    mail(to: email_address_with_name(@passenger.email, @passenger.name),
      subject: "Your flight from #{@flight.departure_airport.code} to #{@flight.arrival_airport.code} is booked!")
  end
end

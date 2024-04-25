class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.upcoming_dates.map { |flight| [flight.formatted_start_date, flight.start_date]}
    @flights = Flight.available(params[:departure_airport_id], params[:arrival_airport_id], params[:start])
  end
end

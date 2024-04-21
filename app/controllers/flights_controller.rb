class FlightsController < ApplicationController
  def index
    @flights = Flight.where(departure_airport_id: params[:departure_airport_id].to_i)
    .where(arrival_airport_id: params[:arrival_airport_id].to_i)
    .where("date_trunc('day', start) = ?", params[:start])
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = Flight.select("date_trunc('day', start) AS start_date").distinct.order(:start_date)
      .map { |flight| [format_date(flight.start_date), flight.start_date]}
  end

  private

  def format_date(date)
    date.strftime("%Y / %B / %d")
  end
end

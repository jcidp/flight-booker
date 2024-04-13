# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[LAX MEX MTY NYC SFO SXF CUN LHR CDG HND].each do |airport|
  Airport.find_or_create_by!(code: airport)
end

Airport.all.each do |departing_airport|
  Airport.all.each do |arrival_airport|
    next if departing_airport == arrival_airport
    Flight.find_or_create_by!(start: Time.now + 7.days,
      duration: (arrival_airport.id - departing_airport.id).abs,
      departure_airport_id: departing_airport.id,
      arrival_airport_id: arrival_airport.id)
  end
end

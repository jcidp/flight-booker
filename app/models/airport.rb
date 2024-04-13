class Airport < ApplicationRecord
  validates :code, format: { with: /[A-Z]{3}/, message: "only allows uppercase letters" }

  has_many :departing_flights, class_name: "Flight", foreign_key: :departure_airport_id
  has_many :arriving_flights, class_name: "Flight", foreign_key: :arrival_airport_id
end

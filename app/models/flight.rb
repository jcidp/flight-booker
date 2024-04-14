class Flight < ApplicationRecord
  validates :start, comparison: { greater_than: Time.now }
  validates :duration, comparison: { greater_than: 0 }

  belongs_to :departure_airport, class_name: "Airport", foreign_key: :departure_airport_id 
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: :arrival_airport_id
  has_many :bookings

  def start_time
    self.start.strftime("%H:%M %Z")
  end
end

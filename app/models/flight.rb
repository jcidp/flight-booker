class Flight < ApplicationRecord
  validates :start, comparison: { greater_than: Time.now }
  validates :duration, comparison: { greater_than: 0 }

  belongs_to :departure_airport, class_name: "Airport", foreign_key: :departure_airport_id 
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: :arrival_airport_id
  has_many :bookings

  scope :upcoming_dates, -> { where(start: Time.now..).select("date_trunc('day', start) AS start_date").distinct.order(:start_date) }

  def start_time
    self.start.strftime("%H:%M %Z")
  end

  def formatted_start_date
    self.start_date.strftime("%Y / %B / %d")
  end

  def self.available(departure_airport_id, arrival_airport_id, start)
    self.where(departure_airport_id: departure_airport_id.to_i)
    .where(arrival_airport_id: arrival_airport_id.to_i)
    .where("date_trunc('day', start) = ?", start)
  end
end

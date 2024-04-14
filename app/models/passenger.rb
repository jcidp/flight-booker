class Passenger < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, format: { with: /\A[-\w\.]+@([-\w]+\.)+[-\w]{2,4}\z/, message: "is not a valid email"}

  belongs_to :booking
end

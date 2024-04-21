import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["passengers"];
  static values = {index: {type: Number, default: 1}}

  connect() {
    this.indexValue = this.passengersTarget.childElementCount;
  }

  add() {
    if (this.passengersTarget.childElementCount > 3) return alert("Can't add more than 4 passengers");
    const passenger = this.buildPassenger();
    this.passengersTarget.appendChild(passenger);
    this.indexValue++;
  }

  buildPassenger() {
    const passenger = document.createElement("div");
    passenger.classList.add("passenger");
    passenger.innerHTML = `<label for="booking_passengers_attributes_${this.indexValue}_name">Name</label>
      <input type="text" name="booking[passengers_attributes][${this.indexValue}][name]" id="booking_passengers_attributes_${this.indexValue}_name" />
      <br>
      <label for="booking_passengers_attributes_${this.indexValue}_email">Email</label>
      <input type="email" name="booking[passengers_attributes][${this.indexValue}][email]" id="booking_passengers_attributes_${this.indexValue}_email" />
      <br>
      <br>`;
    return passenger;
  }

  remove() {
    if (this.passengersTarget.childElementCount === 1) return alert("Must have at least 1 passenger");
    this.passengersTarget.lastElementChild.remove();
    this.indexValue--;
  }
}

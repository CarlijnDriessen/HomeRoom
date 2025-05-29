import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const modal = document.getElementById("responseModal");
    modal.addEventListener("show.bs.modal", (event) => {
      const button = event.relatedTarget;
      const bookingId = button.getAttribute("data-booking-id");
      const actionType = button.getAttribute("data-action-type");

      document.getElementById("modal_booking_id").value = bookingId;
      document.getElementById("modal_action_type").value = actionType;

      const form = document.getElementById("responseForm");
      form.action = `/bookings/${bookingId}/${actionType}`;
    });
  }
}

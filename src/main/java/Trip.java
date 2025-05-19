package model;

public class Trip {
    private String tripId;
    private String bookingId;
    private double distance;
    private double fare;

    public Trip(String tripId, String bookingId, double distance, double fare) {
        this.tripId = tripId;
        this.bookingId = bookingId;
        this.distance = distance;
        this.fare = fare;
    }

    public String getTripId() { return tripId; }
    public String getBookingId() { return bookingId; }
    public double getDistance() { return distance; }
    public double getFare() { return fare; }

    public void displayTrip() {
        System.out.println("Trip ID: " + tripId + " | Booking ID: " + bookingId + " | Distance: " + distance + " km | Fare: $" + fare);
    }
}
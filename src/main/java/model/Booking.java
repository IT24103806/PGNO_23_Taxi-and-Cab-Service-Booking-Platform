package model;

public class Booking {
    private String bookingId;
    private String customerId;
    private String driverId;
    private String pickupLocation;
    private String dropLocation;
    private String cabType;
    private String bookingTime;

    public Booking(String bookingId, String customerId, String driverId, String pickupLocation, String dropLocation, String cabType, String bookingTime) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.driverId = driverId;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.cabType = cabType;
        this.bookingTime = bookingTime;
    }

    public String getBookingId() { return bookingId; }
    public String getCustomerId() { return customerId; }
    public String getDriverId() { return driverId; }
    public String getPickupLocation() { return pickupLocation; }
    public String getDropLocation() { return dropLocation; }
    public String getCabType() { return cabType; }
    public String getBookingTime() { return bookingTime; }

    public void displayBooking() {
        System.out.println("Booking ID: " + bookingId + " | Customer: " + customerId + " | Driver: " + driverId +
                " | From: " + pickupLocation + " -> " + dropLocation + " | Cab: " + cabType);
    }
}
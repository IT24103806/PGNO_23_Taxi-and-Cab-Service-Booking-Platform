package model;

public class Driver extends User {
    private boolean isAvailable;
    private double rating;

    public Driver(String id, String name, String email, String password, double rating, boolean isAvailable) {
        super(id, name, email, password, "driver");
        this.rating = rating;
        this.isAvailable = isAvailable;
    }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }

    @Override
    public void displayInfo() {
        System.out.println("Driver: " + name + " | Rating: " + rating + " | Available: " + isAvailable);
    }
}
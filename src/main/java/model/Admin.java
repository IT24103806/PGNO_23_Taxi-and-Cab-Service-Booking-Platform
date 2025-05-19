package model;

public class Admin extends User {
    public Admin(String id, String name, String email, String password) {
        super(id, name, email, password, "admin");
    }
    public void manageUsers() {
        System.out.println("Managing users...");
    }

    public void overseeBookings() {
        System.out.println("Monitoring bookings...");
    }
    @Override
    public void displayInfo() {
        System.out.println("Admin: " + name);
    }
}
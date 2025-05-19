package model;

public class Admin extends User {
    public Admin(String id, String name, String email, String password) {

        super(id, name, email, password, "admin");
    }

    @Override
    public void displayInfo() {

        System.out.println("Admin: " + name);
    }
}
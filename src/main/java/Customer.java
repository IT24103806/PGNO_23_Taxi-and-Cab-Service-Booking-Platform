public class Customer extends User {
    private String contact;

    public Customer(String id, String name, String email, String password, String contact) {
        super(id, name, email, password, "customer");
        this.contact = contact;
    }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    @Override
    public void displayInfo() {
        System.out.println("Customer: " + name + " | Contact: " + contact);
    }
}
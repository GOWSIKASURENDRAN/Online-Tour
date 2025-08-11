package model;

public class Contact {
    private int id;
    private int customerId;
    private String name;
    private String email;
    private String message;

    // Constructor with all fields
    public Contact(int id, int customerId, String name, String email, String message) {
        this.id = id;
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    // Constructor without ID (for inserting new messages)
    public Contact(int customerId, String name, String email, String message) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}

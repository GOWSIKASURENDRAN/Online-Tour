package model;
public class Booking {
    private int id;
    private String userName;
    private String userEmail;
    private int packageId;
    private String travelDate;
    private int persons;
    private String status;

    // Getters & setters for all fields
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public int getPackageId() { return packageId; }
    public void setPackageId(int packageId) { this.packageId = packageId; }

    public String getTravelDate() { return travelDate; }
    public void setTravelDate(String travelDate) { this.travelDate = travelDate; }

    public int getPersons() { return persons; }
    public void setPersons(int persons) { this.persons = persons; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}

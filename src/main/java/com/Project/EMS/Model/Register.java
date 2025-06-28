package com.Project.EMS.Model;

import java.sql.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Register {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    private String confirmpassword;
    private String email;
    private String role;
    private String phoneNumber;
    private String department;
    private String jobTitle;
    private Date hiredate;
    private String address;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private List<LeaveRequest> leaveRequests;

//    @Transient  // ✅ This will NOT try to store in DB
//    private boolean onLeave;

    // === Getters and Setters ===
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getConfirmpassword() { return confirmpassword; }
    public void setConfirmpassword(String confirmpassword) { this.confirmpassword = confirmpassword; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    @Column(name = "on_leave")
    private Boolean onLeave=false;

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public Date getHiredate() { return hiredate; }
    public void setHiredate(Date hiredate) { this.hiredate = hiredate; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public List<LeaveRequest> getLeaveRequests() { return leaveRequests; }
    public void setLeaveRequests(List<LeaveRequest> leaveRequests) { this.leaveRequests = leaveRequests; }

    public boolean isOnLeave() { return onLeave; }
    public void setOnLeave(boolean onLeave) { this.onLeave = onLeave; }

    // === Constructors ===
    public Register() { super(); }

    public Register(String username, String password, String confirmpassword, String email, String role) {
        this.username = username;
        this.password = password;
        this.confirmpassword = confirmpassword;
        this.email = email;
        this.role = role;
    }

    public Register(int id, String username, String password, String confirmpassword, String email, String role,
                    String phoneNumber, String department, String jobTitle, Date hiredate, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.confirmpassword = confirmpassword;
        this.email = email;
        this.role = role;
        this.phoneNumber = phoneNumber;
        this.department = department;
        this.jobTitle = jobTitle;
        this.hiredate = hiredate;
        this.address = address;
    }

    public Boolean getOnLeave() {
        return onLeave;
    }

    public void setOnLeave(Boolean onLeave) {
        this.onLeave = onLeave;
    }

    public Register(String email, String phoneNumber, String department, String jobTitle, Date hiredate, String address) {
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.department = department;
        this.jobTitle = jobTitle;
        this.hiredate = hiredate;
        this.address = address;
    }

    @Transient
    public String getLeaveStatus() {
        if (Boolean.TRUE.equals(this.onLeave)) {
            return "Pending"; // or "Approved" depending on business logic
        }

        if (leaveRequests != null && !leaveRequests.isEmpty()) {
            LeaveRequest latest = leaveRequests.get(leaveRequests.size() - 1);
            return latest.getStatus();
        }

        return "None";
    }


    // === toString ===
    @Override
    public String toString() {
        return "Register [id=" + id + ", username=" + username + ", password=" + password + ", confirmpassword="
                + confirmpassword + ", email=" + email + ", role=" + role + ", phoneNumber=" + phoneNumber
                + ", department=" + department + ", jobTitle=" + jobTitle + ", hiredate=" + hiredate + ", address="
                + address + "]";
    }
}

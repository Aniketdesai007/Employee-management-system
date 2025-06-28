package com.Project.EMS.Model;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "leave_requests")
public class LeaveRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // Foreign key mapping to Register table
    
   
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employee_id", nullable = false)
    private Register employee;


    public Register getEmployee() {
		return employee;
	}

	public void setEmployee(Register employee) {
		this.employee = employee;
	}

	@Column(name = "leave_type", nullable = false)
    private String leaveType;

	@Column(name = "from_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fromDate;

	@Column(name = "to_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date toDate;

    @Column(name = "number_of_days", nullable = false)
    private Integer numberOfDays;

    @Column(name = "reason", nullable = false, length = 500)
    private String reason;

    @Column(name = "status", nullable = false)
    private String status = "Pending";  // Pending / Approved / Rejected

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public Integer getNumberOfDays() {
		return numberOfDays;
	}

	public void setNumberOfDays(Integer numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LeaveRequest(Integer id, String leaveType, Date fromDate, Date toDate,
			Integer numberOfDays, String reason, String status) {
		super();
		this.id = id;
		this.leaveType = leaveType;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.numberOfDays = numberOfDays;
		this.reason = reason;
		this.status = status;
	}

	public LeaveRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "LeaveRequest [id=" + id  + ", leaveType=" + leaveType + ", fromDate="
				+ fromDate + ", toDate=" + toDate + ", numberOfDays=" + numberOfDays + ", reason=" + reason
				+ ", status=" + status + "]";
	}
    
    
    
}

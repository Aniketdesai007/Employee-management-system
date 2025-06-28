package com.Project.EMS.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Project.EMS.Model.LeaveRequest;

public interface LeaveRequestRepository extends JpaRepository<LeaveRequest, Integer>{

	
}

package com.Project.EMS.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Project.EMS.Model.Register;

@Repository
public interface RegisterdataRepository extends JpaRepository<Register, Integer>{
	public Register findByEmail(String email);
}

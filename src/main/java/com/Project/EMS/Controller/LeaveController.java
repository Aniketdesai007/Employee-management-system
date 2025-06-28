package com.Project.EMS.Controller;


import com.Project.EMS.Model.LeaveRequest;
import com.Project.EMS.Model.Register;
import com.Project.EMS.Repository.LeaveRequestRepository;
import com.Project.EMS.Repository.RegisterdataRepository;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/leave")
public class LeaveController {

    @Autowired(required = true)
    private LeaveRequestRepository leaveRequestRepository;

    @Autowired(required = true)
    private RegisterdataRepository registerdataRepository;
    
    @GetMapping("/{id}")
    public String leaveString(@PathVariable int id,RedirectAttributes redirectAttributes,Model m) {
    Register dataRegister=	registerdataRepository.findById(id).orElse(null);

    m.addAttribute("user_data",dataRegister);
    
    
    	return "/applyLeave.jsp";
		
	}
    
    @RequestMapping("/dashboard/{id}")
    public String showDashboard(@PathVariable int id, RedirectAttributes redirectAttributes) {
        Register employeedata = registerdataRepository.findById(id).orElse(null);

        if (employeedata != null) {
            redirectAttributes.addFlashAttribute("user_data", employeedata);
            return "redirect:/updated";
        }

        redirectAttributes.addFlashAttribute("error", "Employee not found.");
        return "redirect:/error";
    }

    @PostMapping("/apply/{id}")
    public String submitLeave(@PathVariable int id,
            @RequestParam String leaveType,
            @RequestParam String reason,
            @RequestParam Integer numberOfDays,
            @RequestParam  Date fromDate,
            @RequestParam Date toDate,
            RedirectAttributes redirectAttributes) {
    	
    	System.out.println(fromDate);

        Register employee = registerdataRepository.findById(id).orElse(null);

        if (employee != null) {
            LeaveRequest leaveRequest = new LeaveRequest();
            leaveRequest.setLeaveType(leaveType);
            leaveRequest.setReason(reason);
            leaveRequest.setNumberOfDays(numberOfDays);
            leaveRequest.setFromDate(fromDate);
            leaveRequest.setToDate(toDate);
            leaveRequest.setEmployee(employee);
            leaveRequestRepository.save(leaveRequest);
            employee.getLeaveRequests().add(leaveRequest);
            employee.setOnLeave(true);
            registerdataRepository.save(employee);
            redirectAttributes.addFlashAttribute("message", "Leave request submitted successfully.");
            redirectAttributes.addFlashAttribute("user_data", employee);
            return "redirect:/updated";
      }
        redirectAttributes.addFlashAttribute("error", "Employee not found.");
        return "redirect:/error";
    }  
    
    
    @GetMapping("/approve/{id}")
    public String approveLeave(@PathVariable int id, RedirectAttributes redirectAttributes) {
        LeaveRequest leaveRequest = leaveRequestRepository.findById(id).orElse(null);

        if (leaveRequest != null && "Pending".equalsIgnoreCase(leaveRequest.getStatus())) {
            leaveRequest.setStatus("Approved");
            Register employee = leaveRequest.getEmployee();
            employee.setOnLeave(true);

            leaveRequestRepository.save(leaveRequest);
            registerdataRepository.save(employee);

            redirectAttributes.addFlashAttribute("message", "Leave approved successfully.");
        }

        return "redirect:/admin/manage-leaves";
    }


    @GetMapping("/reject/{id}")
    public String rejectLeave(@PathVariable int id, RedirectAttributes redirectAttributes) {
        LeaveRequest leaveRequest = leaveRequestRepository.findById(id).orElse(null);

        if (leaveRequest != null && "Pending".equalsIgnoreCase(leaveRequest.getStatus())) {
            leaveRequest.setStatus("Rejected");

            Register employee = leaveRequest.getEmployee();
            employee.setOnLeave(false); // They're not on leave if rejected

            leaveRequestRepository.save(leaveRequest);
            registerdataRepository.save(employee);

            redirectAttributes.addFlashAttribute("message", "Leave rejected.");
        }

        return "redirect:/admin/manage-leaves";
    }



    
    
    


}


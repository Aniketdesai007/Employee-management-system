package com.Project.EMS.Controller;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Project.EMS.Model.LeaveRequest;
import com.Project.EMS.Model.Register;
import com.Project.EMS.Repository.LeaveRequestRepository;
import com.Project.EMS.Repository.RegisterdataRepository;

@Controller
public class AdminHrcontroller {
	
	@Autowired
	public RegisterdataRepository registerdataRepository;
	@Autowired
	public LeaveRequestRepository leaveRequestRepository;
	@GetMapping("/adminhr")
	public String allemployeedetails(Model m, HttpSession session) {
	    if (session.getAttribute("admin") == null) {
	        return "redirect:/"; // Block access if admin not logged in
	    }

	    List<Register> list = registerdataRepository.findAll();
	    m.addAttribute("registerdata", list);
	    return "viewdata.jsp";
	}

		
	@GetMapping("/admin/employees/delete/{id}")
	public String deleterecord(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
	    if (registerdataRepository.existsById(id)) {
	        registerdataRepository.deleteById(id);
	        redirectAttributes.addFlashAttribute("successMessage", "Employee deleted successfully.");
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "Employee not found.");
	    }
	    return "redirect:/adminhr";
	}

	@RequestMapping("/admin/employees/add")
	public String addnewEmployee(RedirectAttributes m) {
		m.addFlashAttribute("employee", new Register());
	    return "redirect:/Registerform.jsp";
	}

	
	@PostMapping("/admin/employees/save")
	public String newregistration(@ModelAttribute Register registerdata) {
	    System.out.println("Received onLeave: " + registerdata.getOnLeave());
	    registerdataRepository.save(registerdata);
	    return "redirect:/adminhr";
	}

	@RequestMapping("/admin/employees/edit/{id}")
	public String editform(@PathVariable Integer id, RedirectAttributes m) {
	    Register register = registerdataRepository.findById(id).orElse(null);
	    m.addFlashAttribute("employee",  register);
	    return "redirect:/editedform";
	}
	
	@RequestMapping("/editedform")
	public String editedreference() {
		
		return "Registerform.jsp";
		
	}
	
	@RequestMapping("/admindashboard")
	public String backtoadmindashboard(HttpSession session, HttpServletResponse response) {
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);

	    // ✅ Check if admin session exists
	    if (session.getAttribute("admin") == null) {
	        return "redirect:/"; // Not logged in
	    }

	    return "AdminDashboard.jsp";
	}


@RequestMapping("/admin/logout")
public String adminlogout(HttpSession session) {
    if (session != null) {
        session.invalidate(); // ✅ Destroys session
    }
    System.out.println("Successfully logged out");
    return "redirect:/";
}

@GetMapping("/admin/manage-leaves")
public String manageLeaves(Model model, RedirectAttributes redirectAttributes) {
    List<LeaveRequest> leaveRequests = leaveRequestRepository.findAll();

    // Force initialization of employee field
    for (LeaveRequest lr : leaveRequests) {
        lr.getEmployee().getUsername(); // trigger lazy loading
    }

    redirectAttributes.addFlashAttribute("leaveRequests", leaveRequests);
    return "redirect:/ManageLeaved";
}



//@GetMapping("/admin/manage-leaves")
//public String manageLeaves(Model model,RedirectAttributes redirectAttributes) {
//    List<LeaveRequest> leaveRequests = leaveRequestRepository.findAll();
//    model.addAttribute("leaveRequests", leaveRequests);
//    redirectAttributes.addFlashAttribute("leaveRequests", leaveRequests);
//    return "redirect:/ManageLeaved"; // your JSP view name
//}
@RequestMapping("/ManageLeaved")
public String managedleaved() {
	return "ManageLeave.jsp";
}


	
}

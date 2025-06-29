package com.Project.EMS.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Project.EMS.Model.Admin;
import com.Project.EMS.Model.Register;
import com.Project.EMS.Repository.AdminRepository;
import com.Project.EMS.Repository.RegisterdataRepository;

@Controller
public class EmsController {
	@Autowired
	private RegisterdataRepository registerdataRepository;
	@Autowired
	private AdminRepository adminRepository;
	
	
	@GetMapping("/")
	public String firstpage() {
		return "Homepage.jsp";
	}
	
	@GetMapping("/login/entrypage")
	public String loginpage() {
		return "redirect:/Entrypage.jsp";
		
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, Model m, RedirectAttributes redirectAttributes, HttpSession session) {
	    Register rsRegister = registerdataRepository.findByEmail(email);
	    Admin admindata = adminRepository.findByEmail(email);

	    if (rsRegister != null && rsRegister.getPassword().equals(password)) {
	        session.setAttribute("user", rsRegister); // ✅ Store employee session
	        m.addAttribute("user_data", rsRegister);
	        return "EmployeeDashboard.jsp";
	    } else if (admindata != null && admindata.getPassword().equals(password)) {
	        session.setAttribute("admin", admindata); // ✅ Store admin session
	        m.addAttribute("admin", admindata);
	        return "AdminDashboard.jsp";
	    } else {
	        redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
	        return "redirect:/";
	    }
	}

}

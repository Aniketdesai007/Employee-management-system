package com.Project.EMS.Controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Project.EMS.Model.Admin;
import com.Project.EMS.Model.Register;
import com.Project.EMS.Repository.AdminRepository;
import com.Project.EMS.Repository.RegisterdataRepository;

@Controller
public class Registercontroller {
	@Autowired(required = true)
	private RegisterdataRepository registerrepo;
	
	@Autowired(required = true)
	private AdminRepository adminRepository;
	
	@RequestMapping("/register")
	private String register() {
		return "Register.jsp";
	}
	
	@PostMapping("/registeruser")
	private String registeruser(@ModelAttribute Register register, RedirectAttributes redirectAttributes) {
	    if (register.getPassword().equals(register.getConfirmpassword())) {

	        if (register.getRole().equalsIgnoreCase("hr") || register.getRole().equalsIgnoreCase("Admin")) {
	            Admin admin = new Admin(register.getUsername(), register.getPassword(), register.getConfirmpassword(), register.getEmail(), register.getRole());
	            adminRepository.save(admin);
	            System.out.println(admin);
	        } else {
	            register.setOnLeave(false); // ✅ FIX HERE
	            registerrepo.save(register);
	            System.out.println(register);
	        }

	        return "redirect:/";
	    } else {
	        System.out.println("Invalid password and confirm password");
	        return "redirect:/Register.jsp?error=password";
	    }
	}

	
	@RequestMapping("/{id}")
	public String editprofile(@PathVariable Integer id, Model m, HttpSession session) {
	    Object user = session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/"; // Not logged in
	    }

	    Register data = registerrepo.findById(id).orElse(null);
	    if (data != null) {
	        m.addAttribute("editdata", data);
	    }
	    return "Editprofilepage.jsp";
	}

	
	@RequestMapping("/update/{id}")
	public String updateprofile(@PathVariable  Integer id,@ModelAttribute Register register,RedirectAttributes redirectAttributes) {

		Register employeedata=registerrepo.findById(id).orElse(null);
	if (employeedata!=null) {
		employeedata.setAddress(register.getAddress());
		employeedata.setDepartment(register.getDepartment());
		employeedata.setPhoneNumber(register.getPhoneNumber());
		employeedata.setJobTitle(register.getJobTitle());
		employeedata.setHiredate(register.getHiredate());		
	}
	registerrepo.save(employeedata);
	redirectAttributes.addFlashAttribute("user_data",employeedata);
    redirectAttributes.addFlashAttribute("message", "Profile updated successfully.");

	return "redirect:/updated";
	}
	
	@RequestMapping("/updated")
	public String updated() {
		return "EmployeeDashboard.jsp";
	}
	
	@GetMapping("/favicon.ico")
	@ResponseBody
	void returnNoFavicon() {
	    // Do nothing and return no content
	}

	
	
	@RequestMapping("/logout")
	public String logoutdashborad(HttpSession session) {
		session.invalidate();
		System.out.println("logout....");
		return "redirect:/";
	}
	


	
	
}
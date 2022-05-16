package com.shanelilienthal.soloproject.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.shanelilienthal.soloproject.models.Review;
import com.shanelilienthal.soloproject.models.User;
import com.shanelilienthal.soloproject.repositories.UserRepository;
import com.shanelilienthal.soloproject.services.UserService;

@Controller
@RequestMapping("users")
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	UserRepository repository;
	
	
//	Get Requests
	
//	Render a log in form
	@GetMapping("/login")
	public String loginForm(@ModelAttribute("user") User user, HttpSession session) {
		if (session.getAttribute("user") != null) return "redirect:/home";
		return "login.jsp";
	}
	
//	Render a register form
	@GetMapping("/register")
	public String registerForm(@ModelAttribute("user") User user, HttpSession session) {
		if (session.getAttribute("user") != null) return "redirect:/home";
		return "registration.jsp";
	}
	
//	Clear session on log out
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		
		return "redirect:/home";
	}
	
//	Page to view the current user in session and list all of their reviews from db. If no user in session/not current user redirect to home page.
	@GetMapping("/{userId}")
	public String viewUser(Model model, @PathVariable("userId") Long userId, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = service.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
			List<Review> reviews = currentUser.getReviews();
			model.addAttribute("reviews", reviews);
		}
		if (session.getAttribute("user") != userId) return "redirect:/home";		
		
		return "viewUser.jsp";
	}
	
//	Render form to edit user info. If no user in session/not current user redirect to home page
	@GetMapping("/{userId}/edit")
	public String editUser (Model model, @PathVariable("userId") Long userId, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = service.find((Long)session.getAttribute("user"));
			
//			Set password to blank. Will have user enter current password or new password to submit update form. 
			currentUser.setPassword("");
			
			model.addAttribute("currentUser", currentUser);
		}
		if (session.getAttribute("user") != userId) return "redirect:/home";
		
		return "editUser.jsp";
	}
	
//	Post Requests
	
//	Authenticate user info. If successful user added to session and redirected to home page. 
	@PostMapping("/login")
	public String login(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes, HttpSession session, Model model) {
		
		user = this.service.authenticate(user);
	
		if (user != null) {
			session.setAttribute("user", user.getId());
			redirectAttributes.addFlashAttribute("message", String.format("Hello %s! Welcome back to Reviews on Tap!", user.getFirstName()));
			return "redirect:/home";
		}
		
		
		model.addAttribute("message", "Login Failed. Incorrect email or password.");
		return "login.jsp";
	
	}
	
//	Create a new user. Check for any validation errors. When successful redirect to home page with user in session.
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
		
		if (!user.getPassword().equals(user.getPasswordConfirm())) {
			result.rejectValue("password", "Matches", "The passwords do not match!");	
		}
		
		if ( this.repository.findByEmail(user.getEmail()).isPresent() ) {
			result.rejectValue("email", "Email", "Email address is not available.");
		}
		
		if ( result.hasErrors() ) {
			return "registration.jsp";
		}
		
		redirectAttributes.addFlashAttribute("message", String.format("Hello %s! Welcome to Reviews on Tap!", user.getFirstName()));
		
		this.service.create(user);
		
		session.setAttribute("user", user.getId());
		
		return "redirect:/home";
	}
	
//	Update user info upon form submission.
	@PostMapping("/{userId}/update")
	public String update(@Valid @ModelAttribute("currentUser") User user, BindingResult result, @PathVariable("userId") Long userId, HttpSession session) {
		
		if ( result.hasErrors() ) {
			return "editUser.jsp";
		}
		
		
		this.service.save(user);
		
		return String.format("redirect:/users/%d", userId);
	}

}

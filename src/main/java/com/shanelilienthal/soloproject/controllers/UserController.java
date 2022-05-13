package com.shanelilienthal.soloproject.controllers;

import java.util.ArrayList;
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

import com.shanelilienthal.soloproject.models.Beer;
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
	@GetMapping("/login")
	public String loginForm(@ModelAttribute("user") User user) {
		return "login.jsp";
	}
	
	@GetMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		
		return "redirect:/home";
	}
	
	@GetMapping("/{userId}")
	public String viewBeer(Model model, @PathVariable("userId") Long userId, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = service.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
			List<Review> reviews = currentUser.getReviews();
			model.addAttribute("reviews", reviews);
		}
		
		
		return "viewUser.jsp";
	}
	
//	Post Requests
	@PostMapping("/login")
	public String login(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes, HttpSession session, Model model) {
		
		user = this.service.authenticate(user);
	
		if (user != null) {
			session.setAttribute("user", user.getId());
			redirectAttributes.addFlashAttribute("message", String.format("Hello %s! Welcome back to Beer Review!", user.getFirstName()));
			return "redirect:/home";
		}
		
		
		model.addAttribute("message", "Login Failed. Incorrect email or password.");
		return "login.jsp";
	
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		
		if (!user.getPassword().equals(user.getPasswordConfirm())) {
			result.rejectValue("password", "Matches", "The passwords do not match!");	
		}
		
		if ( this.repository.findByEmail(user.getEmail()).isPresent() ) {
			result.rejectValue("email", "Email", "Email address is not available.");
		}
		
		if ( result.hasErrors() ) {
			return "registration.jsp";
		}
		
		
		this.service.create(user);
		
		session.setAttribute("user", user.getId());
		
		return "redirect:/home";
	}

}

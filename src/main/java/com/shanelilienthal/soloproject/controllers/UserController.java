package com.shanelilienthal.soloproject.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		return "redirect:/";
	}
	
	
//	Post Requests
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("user") User user, RedirectAttributes redirectAttributes, HttpSession session, Model model, BindingResult result) {
		
		user = this.service.authenticate(user);
	
		if ( user != null) {
			session.setAttribute("user", user.getId());
			redirectAttributes.addFlashAttribute("message", String.format("Hello %s! Welcome back to Beer Review!", user.getFirstName()));
			return "redirect:/user/dashboard";
		}
		
		if (result.hasErrors()) {
			model.addAttribute("message", "Login Failed.");
			return "login.jsp";
		}
		
		

			return "login.jsp";
			
	}
	
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
		
		redirectAttributes.addFlashAttribute("message", "Thank you for registering for Beer Review!");
		
		this.service.create(user);
		
		session.setAttribute("user", user.getId());
		
		return "redirect:/user/dashboard";
	}

}

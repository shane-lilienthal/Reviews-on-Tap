package com.shanelilienthal.soloproject.controllers;



import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.shanelilienthal.soloproject.models.Review;
import com.shanelilienthal.soloproject.models.User;
import com.shanelilienthal.soloproject.services.ReviewService;
import com.shanelilienthal.soloproject.services.UserService;


@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReviewService reviewService;
	
//	Get Requests
	
	@GetMapping("/home")
	public String home(Model model, @ModelAttribute("review") Review review, HttpSession session) {
		User currentUser = userService.find((Long)session.getAttribute("user"));
		model.addAttribute("currentUser", currentUser);
		
		List<Review> reviews = reviewService.all();
		model.addAttribute("reviews", reviews);
		
		return "home.jsp";
	}
	

	
	


}

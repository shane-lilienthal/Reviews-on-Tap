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
import com.shanelilienthal.soloproject.repositories.BeerRepository;
import com.shanelilienthal.soloproject.repositories.ReviewRepository;
import com.shanelilienthal.soloproject.services.BeerService;
import com.shanelilienthal.soloproject.services.ReviewService;
import com.shanelilienthal.soloproject.services.UserService;


@Controller
@RequestMapping("reviews")
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BeerService beerService;
	
	@Autowired
	ReviewRepository repository;
	
	
//	Get Requests
	
	@GetMapping("/new/{beerId}")
	public String newReviewForm(Model model, @ModelAttribute("review") Review review, @PathVariable("beerId") Long beerId, HttpSession session) {
		
		User currentUser = userService.find((Long)session.getAttribute("user"));
		model.addAttribute("currentUser", currentUser);
		
		Beer beer = beerService.find(beerId);
		model.addAttribute("beer", beer);
		
		return "newReview.jsp";
	}
	

	
	@GetMapping("/{reviewId}")
	public String viewBeer(Model model, @PathVariable("reviewId") Long reviewId) {
		Review review = service.find(reviewId);
		
		model.addAttribute("review", review);
		
		return "viewBeer.jsp";
	}
	
	
//	Post Requests
	@PostMapping("/add")
	public String createReview(@Valid @ModelAttribute("review") Review review, BindingResult result) {
		if (result.hasErrors()) {
			return "newReview.jsp";
		}
		
		this.service.create(review);
		
		return "redirect:/beers/all";
		
	}

}

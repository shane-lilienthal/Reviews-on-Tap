package com.shanelilienthal.soloproject.controllers;



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


import com.shanelilienthal.soloproject.models.Beer;
import com.shanelilienthal.soloproject.models.Review;
import com.shanelilienthal.soloproject.models.User;

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

//	Render form to add a review. Attach current user and the beer that the review will be for. If no user in session, review can't be added.
	@GetMapping("/new/{beerId}")
	public String newReviewForm(Model model, @ModelAttribute("review") Review review,
			@PathVariable("beerId") Long beerId, HttpSession session) {

		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long) session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		if (session.getAttribute("user") == null)
			return "redirect:/home";

		Beer beer = beerService.find(beerId);
		model.addAttribute("beer", beer);

		return "newReview.jsp";
	}

//	Render form to edit a review. If there is no user in session or not the user that left review, redirect to home page.
	@GetMapping("/{reviewId}/edit")
	public String editReview(Model model, @PathVariable("reviewId") Long reviewId, HttpSession session) {

		Review review = service.find(reviewId);
		model.addAttribute("review", review);

		Beer beer = review.getBeer();
		model.addAttribute("beer", beer);

		
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long) session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
			if (currentUser != review.getUser())
				return "redirect:/home";
		}


		return "editReview.jsp";
	}

//	Delete a review. If user not in session or not user that left review, redirect to home page.
	@GetMapping("/{reviewId}/delete")
	public String delete(Model model, @PathVariable("reviewId") Long reviewId, HttpSession session) {
		Review review = service.find(reviewId);
		model.addAttribute("review", review);

		if (session.getAttribute("user") != null && session.getAttribute("user") == review.getUser().getId()) {

			User currentUser = userService.find((Long) session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
			Long userId = currentUser.getId();

			this.service.delete(reviewId);
			return String.format("redirect:/users/%d", userId);

		}

		return "redirect:/home";

	}

//	Post Requests
	
//	Add a review to the database
	@PostMapping("/{beerId}/add")
	public String createReview(@Valid @ModelAttribute("review") Review review, BindingResult result, @PathVariable("beerId") Long beerId, HttpSession session) {
		if (result.hasErrors()) {
			return "newReview.jsp";
		}

		this.service.create(review);

		return String.format("redirect:/beers/%d", beerId);

	}

//	Save updated review info.
	@PostMapping("/{reviewId}/update")
	public String update(Model model, @Valid @ModelAttribute("review") Review review, BindingResult result,
			@PathVariable("reviewId") Long reviewId, HttpSession session) {

		if (result.hasErrors()) {
			return "editReview.jsp";
		}

		this.service.save(review);

		User currentUser = userService.find((Long) session.getAttribute("user"));
		model.addAttribute("currentUser", currentUser);

		Long userId = currentUser.getId();

		return String.format("redirect:/users/%d", userId);
	}

}

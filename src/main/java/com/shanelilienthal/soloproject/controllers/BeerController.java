package com.shanelilienthal.soloproject.controllers;

import java.util.Comparator;
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


import com.shanelilienthal.soloproject.models.Beer;
import com.shanelilienthal.soloproject.models.Review;
import com.shanelilienthal.soloproject.models.User;
import com.shanelilienthal.soloproject.repositories.BeerRepository;

import com.shanelilienthal.soloproject.services.BeerService;
import com.shanelilienthal.soloproject.services.UserService;


@Controller
@RequestMapping("beers")
public class BeerController {
	
	@Autowired
	BeerService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BeerRepository repository;
	
	
//	Get Requests
	
//	Render form to add a new beer. If there is no user in session a beer can't be added.
	@GetMapping("/new")
	public String newBeerForm(Model model, @ModelAttribute("beer") Beer beer, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		if (session.getAttribute("user") == null) return "redirect:/home";
		return "newBeer.jsp";
	}
	
//	Display all of the beers from the database
	@GetMapping("/all")
	public String allBeers(Model model, @ModelAttribute("beer") Beer beer, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		
		List<Beer> beers = service.all();
		
//		Sort beers alphabetically - source code from https://www.codebyamir.com/blog/sort-list-of-objects-by-field-java
		beers.sort(Comparator.comparing(Beer::getName));
		
		model.addAttribute("beers", beers);
		return "allBeers.jsp";
	}
	
//	Display one beer from db with all of its info and reviews
	@GetMapping("/{beerId}")
	public String viewBeer(Model model, @PathVariable("beerId") Long beerId, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		
		Beer beer = service.find(beerId);
		model.addAttribute("beer", beer);
		
		List<Review> reviews = beer.getReviews();
		model.addAttribute("reviews", reviews);
		
		return "viewBeer.jsp";
	}
	
	
//	Post Requests
	
//	Add beer to database upon form submission. If the beer name is already in the db show an error. 
	@PostMapping("/add")
	public String createBeer(@Valid @ModelAttribute("beer") Beer beer, BindingResult result, HttpSession session) {
		if ( this.repository.findByName(beer.getName()).isPresent() ) {
			result.rejectValue("name", "Name", "That beer is already in our collection.");
		}
		if (result.hasErrors()) {
			return "newBeer.jsp";
		}
		
		this.service.create(beer);
		
		return "redirect:/beers/all";
		
	}

}

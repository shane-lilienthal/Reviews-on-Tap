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
	
	@GetMapping("/new")
	public String newBeerForm(Model model, @ModelAttribute("beer") Beer beer, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		return "newBeer.jsp";
	}
	
	@GetMapping("/all")
	public String allBeers(Model model, @ModelAttribute("beer") Beer beer, HttpSession session) {
		if (session.getAttribute("user") != null) {
			User currentUser = userService.find((Long)session.getAttribute("user"));
			model.addAttribute("currentUser", currentUser);
		}
		
		List<Beer> beers = service.all();
		model.addAttribute("beers", beers);
		return "allBeers.jsp";
	}
	
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
	@PostMapping("/add")
	public String createBeer(@Valid @ModelAttribute("beer") Beer beer, BindingResult result) {
		if (result.hasErrors()) {
			return "newBeer.jsp";
		}
		
		this.service.create(beer);
		
		return "redirect:/beers/all";
		
	}

}

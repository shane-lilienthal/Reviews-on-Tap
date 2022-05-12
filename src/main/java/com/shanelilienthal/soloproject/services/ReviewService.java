package com.shanelilienthal.soloproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.shanelilienthal.soloproject.models.Review;

import com.shanelilienthal.soloproject.repositories.ReviewRepository;


@Service
public class ReviewService {

	@Autowired
	private ReviewRepository repository;
	
	public List<Review> all() {
		return this.repository.findAll();
	}
	
//	Create new beer
	public Review create(Review review) {
		return this.repository.save(review);
	}
	
//	Find one beer
	public Review find(Long id) {
		return this.repository.findById(id).get();
	}
}

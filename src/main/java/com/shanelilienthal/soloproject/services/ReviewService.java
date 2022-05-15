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
	
//	Get all reviews
	public List<Review> all() {
		return this.repository.findAll();
	}
	
//	Find one review
	public Review find(Long id) {
		return this.repository.findById(id).get();
	}
	
//	Create new review
	public Review create(Review review) {
		return this.repository.save(review);
	}
	
//	Save review on update
	public Review save(Review review) {
		return this.repository.save(review);
	}
	
//	Delete a review
	public void delete(Long id) {
		 this.repository.deleteById(id);
	 }

	
}

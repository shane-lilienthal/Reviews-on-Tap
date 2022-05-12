package com.shanelilienthal.soloproject.repositories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;



import com.shanelilienthal.soloproject.models.Review;


public interface ReviewRepository extends CrudRepository<Review, Long> {
	
	List<Review>findAll();
	
}

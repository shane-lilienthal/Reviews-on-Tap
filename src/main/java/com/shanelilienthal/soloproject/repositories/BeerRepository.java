package com.shanelilienthal.soloproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.shanelilienthal.soloproject.models.Beer;


public interface BeerRepository extends CrudRepository<Beer, Long> {
	
//	Find all beers
	List<Beer>findAll();
	
//	Find a beer by name
	Optional<Beer>findByName(String name);
}

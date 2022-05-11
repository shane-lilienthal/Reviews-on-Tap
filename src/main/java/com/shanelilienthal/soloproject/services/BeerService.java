package com.shanelilienthal.soloproject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shanelilienthal.soloproject.models.Beer;

import com.shanelilienthal.soloproject.repositories.BeerRepository;


@Service
public class BeerService {

	@Autowired
	private BeerRepository repository;
	
	public List<Beer> all() {
		return this.repository.findAll();
	}
	
//	Create new beer
	public Beer create(Beer beer) {
		return this.repository.save(beer);
	}
	
//	Find one beer
	public Beer find(Long id) {
		return this.repository.findById(id).get();
	}
}

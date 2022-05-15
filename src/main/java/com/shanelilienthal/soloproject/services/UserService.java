package com.shanelilienthal.soloproject.services;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.shanelilienthal.soloproject.models.User;
import com.shanelilienthal.soloproject.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository repository;
	
//	Get all users
	public List<User> all() {
		return this.repository.findAll();
	}
	
//	Find one user
	public User find(Long id) {
		return this.repository.findById(id).get();
	}
	
//	Find the current user in session
	public User findCurrentUser(HttpSession session) {
		if (session.getAttribute("user") == null) return null;
		return this.find((Long) session.getAttribute("user")); 
	}
	
//	Create new user. Hash the password with BCrypt to store in db.
	public User create(User user) {
		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashedPassword);
		
		return this.repository.save(user);
	}
	
//	Authenticate user on login. Find user by email address. Check if there is a user in db and if their password matches. 
	public User authenticate(User user) {
		Optional<User> foundUser = this.repository.findByEmail(user.getEmail());
		
		if ( foundUser.isEmpty() || ! BCrypt.checkpw(user.getPassword(), foundUser.get().getPassword()) ) {
			return null;
		}
		return foundUser.get();
	}
	
//	Save user info on update. Save password as hashed password using BCrypt.  
	 public User save(User user) {
		 String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashedPassword);
		 return this.repository.save(user);
	 }
}
	


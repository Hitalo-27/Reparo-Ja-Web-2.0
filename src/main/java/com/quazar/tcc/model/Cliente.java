package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.UserService;

public class Cliente implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private User user;
	private Long id_user;

	public Cliente() {
	}

	public Cliente(Long id, User user) {
		this.id = id;
		this.user = user;
	}
	
	public Cliente(User user) {
		this.user = user;
	}
	
	public Cliente(Long id, Long id_user) {
		this.id = id;
		this.id_user = id_user;	
		UserService userService = new UserService();	
		this.user = userService.selectUserById(new User(id_user));
	}
	
	public Cliente(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Long getId_user() {
		return id_user;
	}

	public void setId_user(Long id_user) {
		this.id_user = id_user;
	}
	
}

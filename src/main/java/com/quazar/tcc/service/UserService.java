package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.User;

public class UserService {
	
	private UserDao userDao = new UserDao();

	public User selectUserById(User user) {
		List<User> listaUsers = userDao.listarUsers();
		for(User u : listaUsers) {
			if(u.getId() == user.getId()) {
				return u;
			}
		}
		return null;
	}
	
	public User selectUserByEmail(User user) {
		List<User> listaUsers = userDao.listarUsers();
		for(User u : listaUsers) {
			if(u.getEmail().equals(user.getEmail())) {
				return u;
			}
		}
		return null;
	}
}

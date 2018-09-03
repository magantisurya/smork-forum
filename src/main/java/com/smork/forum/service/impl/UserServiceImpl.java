package com.smork.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.smork.forum.dao.UserDao;
import com.smork.forum.exception.UsernameAlreadyExistsException;
import com.smork.forum.model.AuthUser;
import com.smork.forum.model.UserDto;
import com.smork.forum.service.UserService;

@Service
public class UserServiceImpl implements UserDetailsService, UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public void doSignUp(AuthUser authUser) throws UsernameAlreadyExistsException {
		try {
			System.out.println(userDao.doSignUp(authUser));
		} catch (DuplicateKeyException e) {
			throw new UsernameAlreadyExistsException();
		}
	}

	@Override
	public void deleteUserByUserName(String username) {
		try {
			userDao.deleteUserByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<AuthUser> getAllUsers() {
		List<AuthUser> users = null;
		try {
			users = userDao.getAllUsers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public AuthUser loadUserByUsername(String email) throws UsernameNotFoundException {
		if (email == null || email.trim().length() == 0)
			throw new UsernameNotFoundException("User Name is empty");
		AuthUser authUser;
		try {
			authUser = userDao.getUserByEmail(email);
		} catch (EmptyResultDataAccessException e) {
			throw new UsernameNotFoundException("User not found");
		}
		if (authUser == null)
			throw new UsernameNotFoundException("User not found");
		return authUser;
	}

	@Override
	public void toggleEnableUserByUserName(String username) {
		try {
			userDao.toggleEnableUserByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUserDetailsByUserName(String username, UserDto authUser) {
		try {
			userDao.updateUserDetailsByUserName(username, authUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public AuthUser getUserByEmail(String username) {
		return loadUserByUsername(username);
	}

	@Override
	public void editUserByUserName(String username, UserDto user) {
		updateUserDetailsByUserName(username, user);
		userDao.updateUserAuthorityByUserName(username, user.getAuthorities());
	}

	@Override
	public boolean isEmailNotRegistered(String email) {
		AuthUser authUser = null;
		try {
			authUser = userDao.getUserByEmail(email);
		} catch (EmptyResultDataAccessException e) {
		}
		return authUser == null;
	}

}

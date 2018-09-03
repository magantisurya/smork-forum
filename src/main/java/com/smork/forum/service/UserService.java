package com.smork.forum.service;

import java.util.List;

import com.smork.forum.exception.UsernameAlreadyExistsException;
import com.smork.forum.model.AuthUser;
import com.smork.forum.model.UserDto;

public interface UserService {
	public void doSignUp(AuthUser authUser) throws UsernameAlreadyExistsException;

	public void deleteUserByUserName(String username);

	public List<AuthUser> getAllUsers();

	public void toggleEnableUserByUserName(String username);

	public void updateUserDetailsByUserName(String username, UserDto authUser);

	public void editUserByUserName(String username, UserDto user);

	public boolean isEmailNotRegistered(String username);

	public AuthUser getUserByEmail(String email);

}

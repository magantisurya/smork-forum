package com.smork.forum.dao;

import java.util.List;

import com.smork.forum.model.AuthUser;
import com.smork.forum.model.UserDto;

public interface UserDao {

	public Number doSignUp(AuthUser authUser);

	public void deleteUserByUserName(String username);

	public AuthUser getUserByEmail(String email);

	public List<AuthUser> getAllUsers();

	public void toggleEnableUserByUserName(String username);

	public void updateUserDetailsByUserName(String username, UserDto authUser);

	public void updateUserPasswordByUserName(String username, String encodedPassword);

	public void updateUserAuthorityByUserName(String username, String authority);

}

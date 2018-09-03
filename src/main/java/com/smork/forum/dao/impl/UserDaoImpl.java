package com.smork.forum.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.smork.forum.dao.UserDao;
import com.smork.forum.model.AuthUser;
import com.smork.forum.model.AuthUserMapper;
import com.smork.forum.model.UserDto;

@Repository
@PropertySource("classpath:queries.properties")
public class UserDaoImpl implements UserDao {

	@Autowired
	Environment env;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public Number doSignUp(AuthUser authUser) {
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		/*
		 * jdbcTemplate.update(new PreparedStatementCreator() {
		 * 
		 * @Override public PreparedStatement createPreparedStatement(Connection con)
		 * throws SQLException { PreparedStatement statement =
		 * con.prepareStatement(env.getProperty("user.insert")); statement.setString(0,
		 * authUser.getUsername()); statement.setString(1, authUser.getEmail());
		 * statement.setString(2, authUser.getPassword()); statement.setLong(3, 1);
		 * statement.setString(4, authUser.getFirstName()); statement.setString(5,
		 * authUser.getLastName()); statement.setString(6,
		 * authUser.getProfilePicture()); statement.setTimestamp(7, new
		 * Timestamp(authUser.getDob().getTime())); return statement; } }, holder);
		 */
		System.out.println("inseritng"+authUser);
		jdbcTemplate.update(env.getProperty("user.insert"), authUser.getUsername(), authUser.getEmail(),
				authUser.getEncodedPassword(), 1, authUser.getFirstName(), authUser.getLastName(),
				authUser.getProfilePicture(), authUser.getDob());
		return holder.getKey();
	}

	@Override
	public void deleteUserByUserName(String username) {
		jdbcTemplate.update(env.getProperty("queryDeleteUserByUserName"), username);
	}

	@Override
	public AuthUser getUserByEmail(String email) throws UsernameNotFoundException {
		return jdbcTemplate.queryForObject(env.getProperty("user.select.email"), new Object[] { email },
				new AuthUserMapper());
	}

	@Override
	public List<AuthUser> getAllUsers() {
		return jdbcTemplate.query(env.getProperty("queryGetAllUsers"), new AuthUserMapper());
	}

	@Override
	public void toggleEnableUserByUserName(String username) {
		jdbcTemplate.update(env.getProperty("queryToggleEnableUserByUserName"), username);
	}

	@Override
	public void updateUserDetailsByUserName(String username, UserDto authUser) {
		jdbcTemplate.update(env.getProperty("queryUpdateUserDetail"), authUser.getUsername(), authUser.getFirstName(),
				authUser.getLastName(), username);
	}

	@Override
	public void updateUserPasswordByUserName(String username, String encodedPassword) {
		jdbcTemplate.update(env.getProperty("queryUpdateUserPassword"), encodedPassword, username);
	}

	@Override
	public void updateUserAuthorityByUserName(String username, String authority) {
		jdbcTemplate.update(env.getProperty("queryUpdateUserAuthority"), authority, username);
	}

}

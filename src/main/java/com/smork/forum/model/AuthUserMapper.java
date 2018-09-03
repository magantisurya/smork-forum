package com.smork.forum.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class AuthUserMapper implements RowMapper<AuthUser> {

	@Override
	public AuthUser mapRow(ResultSet rs, int rowNo) throws SQLException {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for (String authority : rs.getString("role").split(",")) {
			authorities.add(new SimpleGrantedAuthority(authority.trim()));
		}
		AuthUser authUser = new AuthUser(rs.getString("username"), rs.getString("password"), true, true, true, true,
				authorities);
		authUser.setFirstName(rs.getString("firstName"));
		authUser.setLastName(rs.getString("lastName"));
		authUser.setUserId(rs.getLong("userId"));
		authUser.setDob(rs.getDate("dob"));
		authUser.setProfilePicture(rs.getString("profilePicture"));
		authUser.setUserId(rs.getLong("userId"));
		authUser.setEmail(rs.getString("email"));
		return authUser;
	}

}

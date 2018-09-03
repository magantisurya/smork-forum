package com.smork.forum.model;

import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class AuthUser extends User {

	private static final long serialVersionUID = -1605240819927992872L;

	@Override
	public String toString() {
		return "AuthUser [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", profilePicture=" + profilePicture + ", dob=" + dob + ", getUsername()=" + getUsername() + "]";
	}

	private static BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	private Long userId;
	private String firstName;
	private String lastName;

	private String email;

	private String profilePicture;

	private Date dob;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public AuthUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public AuthUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAuthoritiesString() {
		String authorities = null;
		for (GrantedAuthority authority : getAuthorities()) {
			if (authorities == null)
				authorities = authority.toString();
			else
				authorities += ", " + authority.toString();
		}
		return authorities;
	}

	public String getEncodedPassword() {
		System.out.println("Encoding this.getPassword()" + this.getPassword());
		return passwordEncoder.encode(this.getPassword());
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}

package com.smork.forum.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smork.forum.exception.UsernameAlreadyExistsException;
import com.smork.forum.model.AuthUser;
import com.smork.forum.model.UserDto;
import com.smork.forum.service.UserService;

@Controller
public class SecurityController {
	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String showLoginPage(Model model) {
		return "login";
	}

	@GetMapping(value = { "", "/" })
	public String home(Model model) {
		return "index";
	}

	@GetMapping("/is-email-not-registered")
	@ResponseBody
	public boolean isUsernameUnique(@RequestParam String email) {
		return userService.isEmailNotRegistered(email);
	}

	@GetMapping("/signup")
	public String showSignupPage(Model model) {
		return "signup";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute UserDto userDto, RedirectAttributes attributes, HttpServletRequest request) {
		try {
			AuthUser authUser = userDto.getAuthUser();
			userService.doSignUp(authUser);
			request.login(authUser.getEmail(), authUser.getPassword());
			return "redirect:/";
		} catch (UsernameAlreadyExistsException e) {
			attributes.addFlashAttribute("showModal", true);
			attributes.addFlashAttribute("modalTitle", "Could not sign up");
			attributes.addFlashAttribute("modalBody", "User Name already exists");
		} catch (ServletException e) {
			e.printStackTrace();
			attributes.addFlashAttribute("showModal", true);
			attributes.addFlashAttribute("modalTitle", "Could not sign up");
			attributes.addFlashAttribute("modalBody", e.getMessage());
		}
		return "redirect:/signup";
	}
}

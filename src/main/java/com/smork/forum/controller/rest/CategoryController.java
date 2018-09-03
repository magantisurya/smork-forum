package com.smork.forum.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smork.forum.model.AuthUser;
import com.smork.forum.model.Category;
import com.smork.forum.model.Response;
import com.smork.forum.service.CategoryService;

/**
 * @author Rahil Husain
 *
 */
@RestController
@RequestMapping("/rest/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/")
	public Response getAllCategories() {
		return categoryService.getAllCategories();
	}

	@PostMapping("/add")
	public Response addCategory(@RequestBody Category category) {
		AuthUser userDetails = (AuthUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		category.setCreatedBy(userDetails.getUserId());
		return categoryService.addCategory(category);
	}

	@GetMapping("/delete")
	public Response deleteCategory(@RequestParam long categoryId) {
		return categoryService.deleteCategory(categoryId);
	}
}

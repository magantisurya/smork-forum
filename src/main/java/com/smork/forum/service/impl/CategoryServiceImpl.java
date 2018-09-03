/**
 * 
 */
package com.smork.forum.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.smork.forum.dao.CategoryDao;
import com.smork.forum.model.Category;
import com.smork.forum.model.Response;
import com.smork.forum.service.CategoryService;

/**
 * @author Rahil Husain
 *
 */
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public Response getAllCategories() {
		try {
			return new Response(categoryDao.getAllCategories());
		} catch (EmptyResultDataAccessException e) {
			return Response.NO_CONTENT;
		}
	}

	@Override
	public Response addCategory(Category category) {
		if (categoryDao.addCategory(category) > 0)
			return Response.CREATED;
		return Response.BAD_REQUEST;
	}

	@Override
	public Response deleteCategory(long categoryId) {
		if (categoryDao.deleteCategory(categoryId) > 0)
			return Response.SUCCESS;
		return Response.NOT_FOUND;
	}

}

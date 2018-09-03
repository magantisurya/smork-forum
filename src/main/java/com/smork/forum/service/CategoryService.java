/**
 * 
 */
package com.smork.forum.service;

import com.smork.forum.model.Category;
import com.smork.forum.model.Response;

/**
 * @author Rahil Husain
 *
 */
public interface CategoryService {
	Response getAllCategories();

	Response addCategory(Category category);

	Response deleteCategory(long categoryId);
}

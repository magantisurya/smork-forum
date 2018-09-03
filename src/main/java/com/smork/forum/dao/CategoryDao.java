/**
 * 
 */
package com.smork.forum.dao;

import java.util.List;
import java.util.Map;

import com.smork.forum.model.Category;

/**
 * @author Rahil Husain
 *
 */
public interface CategoryDao {

	List<Map<String, Object>> getAllCategories();

	int addCategory(Category category);

	int deleteCategory(long categoryId);
}

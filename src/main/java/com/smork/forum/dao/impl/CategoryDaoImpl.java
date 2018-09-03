/**
 * 
 */
package com.smork.forum.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.smork.forum.dao.CategoryDao;
import com.smork.forum.model.Category;

/**
 * @author Rahil Husain
 *
 */
@Repository
@PropertySource("classpath:queries.properties")
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String, Object>> getAllCategories() {
		return jdbcTemplate.queryForList(
				"select *,avg(a.totalTopics) avgTopicsPerMonth from(SELECT c.CATEGORY_ID categoryId, c.CATEGORY_NAME categoryName, c.CREATED_BY createdBy, c.CREATION_TIME creationTime, c.DESCRIPTION description, COUNT(t.TOPIC_ID) totalTopics FROM category c LEFT JOIN user u ON u.USER_ID = c.CREATED_BY left join topic t on t.CATAGORY_ID=c.CATEGORY_ID group by Year(t.CREATION_TIME), MONTH(t.CREATION_TIME))a group by a.categoryId");
	}

	@Override
	public int addCategory(Category category) {
		return jdbcTemplate.update("insert into category(CATEGORY_NAME, CREATED_BY, DESCRIPTION) values(?,?,?)",
				category.getCategoryName(), category.getCreatedBy(), category.getDescription());
	}

	@Override
	public int deleteCategory(long categoryId) {
		return jdbcTemplate.update("delete from category where CATEGORY_ID=?", categoryId);
	}

}

/**
 * 
 */
package com.smork.forum.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.smork.forum.dao.TopicDao;
import com.smork.forum.model.Topic;

/**
 * @author Rahil Husain
 *
 */

@Repository
@PropertySource("classpath:queries.properties")
public class TopicDaoImpl implements TopicDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String, Object>> getTopics(long categoryId, boolean latest, boolean top, Date fromDate,
			Date toDate) {
		String q = "SELECT t.TOPIC_ID topicId, t.SUBJECT subject, t.CONTENT content, t.CATAGORY_ID categoryId, c.CATEGORY_NAME categoryName, t.CREATED_BY createdBy, t.CREATION_TIME creationTime, t.STATUS status, CONCAT('{\"userId\":', creator.USER_ID, ', \"username\":\"', creator.USERNAME, '\", \"profilePicture\":\"', creator.PROFILE_PICTURE, '\"}') creator,(select COUNT(r.REPLY_ID) from replies r where r.TOPIC_ID = t.TOPIC_ID) totalReplies, (select MIN(r.CREATION_TIME) from replies r where r.TOPIC_ID = t.TOPIC_ID) firstActivity, (select MAX(r.CREATION_TIME) from replies r where r.TOPIC_ID = t.TOPIC_ID) lastActivity, ( select GROUP_CONCAT(CONCAT('{\"userId\":', u.USER_ID, ', \"username\":\"', u.USERNAME, '\", \"profilePicture\":\"', u.PROFILE_PICTURE, '\"}')) from user u where u.USER_ID=ta.GIVEN_TO_USER group by ta.TOPIC_ID) users FROM topic t LEFT JOIN topic_access ta ON ta.TOPIC_ID = t.TOPIC_ID LEFT JOIN category c ON c.CATEGORY_ID = t.CATAGORY_ID LEFT JOIN user creator ON t.CREATED_BY = creator.USER_ID";
		String where = "";
		String orderBy = "";
		if (categoryId != 0)
			where = " where t.CATAGORY_ID='" + categoryId + "'";
		if (fromDate != null)
			where = where.isEmpty() ? (" where t.CREATION_TIME>'" + fromDate + "'")
					: (" and t.CREATION_TIME>'" + fromDate + "'");
		if (toDate != null)
			where = where.isEmpty() ? (" where t.CREATION_TIME<'" + fromDate + "'")
					: (" and t.CREATION_TIME<'" + fromDate + "'");
		if (latest)
			orderBy = " ORDER BY t.CREATION_TIME DESC ";
		// if (top)
		// orderBy = orderBy.isEmpty() ? (" where t.CATAGORY_ID='" + categoryId + "'") :
		// "";
		return jdbcTemplate.queryForList(q + where + orderBy);
	}

	@Override
	public int addTopic(Topic topic) {
		return jdbcTemplate.update(
				"insert into topic(SUBJECT, CONTENT, CATAGORY_ID, CREATED_BY, STATUS) values(?,?,?,?,'ACTIVE')",
				topic.getSubject(), topic.getContent(), topic.getCategoryId(), topic.getCreatedBy());
	}

	@Override
	public Map<String, Object> getTopic(long topicId) {
		return jdbcTemplate.queryForMap(
				"SELECT t.TOPIC_ID topicId, t.SUBJECT subject, t.CONTENT content, t.CATAGORY_ID categoryId, c.CATEGORY_NAME categoryName, t.CREATED_BY createdBy, t.CREATION_TIME creationTime, t.STATUS status, CONCAT('{\"userId\":', creator.USER_ID, ', \"username\":\"', creator.USERNAME, '\", \"profilePicture\":\"', creator.PROFILE_PICTURE, '\"}') creator, GROUP_CONCAT(CONCAT('{\"userId\":', u.USER_ID, ', \"username\":\"', u.USERNAME, '\", \"profilePicture\":\"', u.PROFILE_PICTURE, '\"}')) users, COUNT(r.REPLY_ID) totalReplies, MIN(r.CREATION_TIME) firstActivity, MAX(r.CREATION_TIME) lastActivity FROM topic t LEFT JOIN topic_access ta ON ta.TOPIC_ID = t.TOPIC_ID LEFT JOIN replies r ON r.TOPIC_ID = t.TOPIC_ID LEFT JOIN category c ON c.CATEGORY_ID = t.CATAGORY_ID LEFT JOIN user u ON u.USER_ID = ta.GIVEN_TO_USER LEFT JOIN user creator ON t.CREATED_BY = creator.USER_ID WHERE t.TOPIC_ID = ?",
				topicId);
	}

	@Override
	public int deleteTopic(long topicId) {
		return jdbcTemplate.update("delete from topic where TOPIC_ID=?", topicId);
	}
}

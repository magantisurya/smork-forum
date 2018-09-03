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

import com.smork.forum.dao.ReplyDao;
import com.smork.forum.model.Reply;

/**
 * @author Rahil Husain
 *
 */
@Repository
@PropertySource("classpath:queries.properties")
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String, Object>> getReplies(long topicId) {
		return jdbcTemplate.queryForList(
				"SELECT pr.REPLY_ID replyId, pr.CREATION_TIME creationTime, pr.CONTENT content, pr.TOPIC_ID topicId, pr.PARENT_ID parentId, CONCAT('{\"userId\":', pu.USER_ID, ', \"username\":\"', pu.USERNAME, '\", \"profilePicture\":\"', pu.PROFILE_PICTURE, '\"}') user FROM replies pr LEFT JOIN user pu ON pu.USER_ID = pr.REPLIED_BY WHERE pr.TOPIC_ID = ?",
				topicId);
	}

	@Override
	public int addReply(Reply reply) {
		return jdbcTemplate.update("insert into replies(REPLIED_BY, CONTENT, TOPIC_ID, PARENT_ID) values(?,?,?,?)",
				reply.getRepliedBy(), reply.getContent(), reply.getTopicId(), reply.getParentId());
	}

	@Override
	public int deleteReply(long replyId) {
		return jdbcTemplate.update("delete from replies where REPLY_ID=?", replyId);
	}

}

/**
 * 
 */
package com.smork.forum.dao;

import java.util.List;
import java.util.Map;

import com.smork.forum.model.Reply;

/**
 * @author Rahil Husain
 *
 */
public interface ReplyDao {

	List<Map<String, Object>> getReplies(long topicId);

	int addReply(Reply reply);

	int deleteReply(long replyId);
}

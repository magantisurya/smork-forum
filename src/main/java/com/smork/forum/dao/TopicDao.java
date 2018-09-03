/**
 * 
 */
package com.smork.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.smork.forum.model.Topic;

/**
 * @author Rahil Husain
 *
 */
public interface TopicDao {
	List<Map<String, Object>> getTopics(long categoryId, boolean latest, boolean top, Date fromDate, Date toDate);

	int addTopic(Topic topic);

	Map<String, Object> getTopic(long topicId);

	int deleteTopic(long topicId);

}

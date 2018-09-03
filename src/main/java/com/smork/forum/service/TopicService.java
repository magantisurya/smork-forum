/**
 * 
 */
package com.smork.forum.service;

import java.util.Date;

import com.smork.forum.model.Response;
import com.smork.forum.model.Topic;

/**
 * @author Rahil Husain
 *
 */
public interface TopicService {
	Response getTopics(long categoryId, boolean latest, boolean top, Date fromDate, Date toDate);

	Response addTopic(Topic topic);

	Response deleteTopic(long topicId);

	Response getTopic(long topicId);
}
